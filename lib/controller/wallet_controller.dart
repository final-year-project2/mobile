import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:frontend/controller/error_controller.dart';
import 'package:frontend/controller/ticket_controller.dart';
import 'package:frontend/models/wallet_model.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class WalletController extends GetxController {
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    final responseBalance = await getWalletInformations();
    walletAmount.value = responseBalance.balance;
    await getRecentTransaction();
  }

  HttpServices? httpServices;
  RxBool walletInfoIsLoading = true.obs;
  RxBool networkException = false.obs;
  RxBool isTransactionLoading = true.obs;
  RxBool chapaWebViewIsLoading = false.obs;
  RxBool isVerificationResultLoading = true.obs;
  Map<String, dynamic>? verificationResult;
  RxString walletAmount = '0'.obs;
  RxString? addedMoney = ''.obs;
  RxString? transaction_reference = ''.obs;

  // RxList transactionDetail = [].obs;
  // List<Map<String, dynamic>> transactionDetail = [];

  final tokenBox = GetStorage();

  RxString userEnteredAmount = ''.obs;
  //walletid in url
  //amount
  //txntypt
  dio.Dio _dio = dio.Dio();
  WalletController() {
    httpServices = HttpServices();
    httpServices?.initAuthenticated();
  }
  String? txRef;
  String? storedTxRef;

  Future<void> addMoneyToWallet(
      BuildContext context, String userEnteredAmount) async {
    try {
      String txRef = TxRefRandomGenerator.generate(prefix: 'Pharmabet');
      String storedTxRef = TxRefRandomGenerator.gettxRef;
      print('Generated TxRef: $txRef');
      print('Stored TxRef: $storedTxRef');

      String? paymentUrl = await Chapa.getInstance.startPayment(
          // returnUrl: '/wallet',

          callbackUrl:
              "https://api.chapa.co/v1/transaction/verify/$storedTxRef",
          context: context,
          txRef: storedTxRef,
          amount: userEnteredAmount,
          currency: 'ETB',
          enableInAppPayment: true,
          onInAppPaymentSuccess: (successMsg) async {
            Get.toNamed('success');
            print('successMsg $successMsg');
            //verify the payment fucntion run
            verificationResult = await Chapa.getInstance.verifyPayment(
              txRef: storedTxRef ?? '',
            );
            isVerificationResultLoading.value = false;
            verificationResult?.values.forEach((element) {
              print('element$element');
            });

            int? walletMoney = verificationResult?['data']['amount'];

            addedMoney?.value =
                verificationResult?['data']['amount'].toString() ?? '';
            transaction_reference?.value =
                verificationResult?['data']['reference'];
            print('${addedMoney} andpoint ${transaction_reference?.value}');

            String sentAmount = walletMoney.toString();
            // print('SentAmount:$sentAmount');
            // int walletId = tokenBox.read('wallet_id');
            // print('walletId:$walletId');

            final response = await updateWalletForDeposit(sentAmount);
            print('backend response $response');

            // final walletResponse = await getWalletInformations();
            // walletAmount.value = walletResponse.balance;
            // print('finalWalletResponse :${walletAmount.value}');

            // print('backendresponse:${response}');
            //redirect to success page
          },
          onInAppPaymentError: (errorMsg) {
            print('errorMsg $errorMsg');
          });

      print('Transaction finished:$paymentUrl');
    } on ChapaException catch (e) {
      if (e is AuthException) {
        print('In app $e ');
      } else if (e is InitializationException) {
        print('In app $e ');
      } else if (e is NetworkException) {
        //show popup
        networkException.value = true;
        print('In app $e ');
      } else if (e is ServerException) {
        print('In app $e ');
      } else {
        print('Unknown error occurs duing Adding Money to Wallet');
      }
    }
  }

  Future<void> verify() async {
    Map<String, dynamic> verificationResult =
        await Chapa.getInstance.verifyPayment(
      txRef: storedTxRef ?? '',
    );

    verificationResult.values.forEach((element) {
      print(element);
    });
  }

  Future<dio.Response> updateWalletForDeposit(String amount) async {
    final walletId = tokenBox.read('walletId');
    print("Wallet id $walletId");
    try {
      final response = await httpServices!.postRequest(
          '/user/updateWallet/$walletId',
          {"amount": "$amount", "transaction_type": "deposit"});

      print('response $response');
      if (response == null) {
        return throw Exception('update-deposte response is null');
      }
      return response;
    } on dio.DioException catch (e) {
      print('error occure depositing ');
      Get.find<ErrorHandlerService>().handleError(e);
      throw Exception(e);
    }
  }

  Future<WalletModel> getWalletInformations() async {
    final walletId = tokenBox.read('walletId');
    print('start:$walletId');
    try {
      final response =
          await httpServices?.getRequest('/user/retriveWalletInfo/$walletId');
      walletInfoIsLoading.toggle();
      if (response == null) {
        return throw Exception('update-deposte response is null');
      }
      print('wallet-data:${WalletModel.fromJson(response.data)}');
      return WalletModel.fromJson(response.data);
    } on dio.DioException catch (e) {
      print('error@ getWalletinfo:$e');
      Get.find<ErrorHandlerService>().handleError(e);

      throw Exception(e);
    }
  }

  Future<List<TransactionModel>> getRecentTransaction() async {
    final walletId = tokenBox.read('walletId');

    try {
      final response = await httpServices
          ?.getRequest('user/retiveTransactionInfo/$walletId');
      if (response?.statusCode == 200) {
        isTransactionLoading.value = false;
      }

      // print('bTransaction:${response?.data}');
      // print('transaction: $response');

      if (response == null) {
        return throw Exception('transaction response is null');
      }

      transactions.value = TransactionModel.fromJsonList(response.data);
      print('Transaction :${transactions}');

      return transactions;
    } on dio.DioException catch (e) {
      Get.find<ErrorHandlerService>().handleError(e);

      print('error transaction data $e');
      throw Exception(e);
    }
  }

  // Future<void> banks() async {
  //   var headers = {
  //     'Authorization': 'Bearer CHASECK_TEST-wTO8aSlO9lY9o68ctP0q1WSvI7ftXyzR'
  //   };
  //   var request =
  //       http.Request('GET', Uri.parse('https://api.chapa.co/v1/banks'));

  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('payout ${await response.stream.bytesToString()}');
  //   } else {
  //     print('payouterror ${response.reasonPhrase}');
  //   }
  // }

  void payout() async {
    // Prepare headers
    Map<String, String> headers = {
      "Authorization": "Bearer CHASECK_TEST-NMHnfnAw81g9EWXYoSm6FrobP7rePyRd",
      "Content-Type": "application/json"
    };

    // Prepare payload
    String rawPayload = jsonEncode({
      "account_name": "Israel Goytom",
      "account_number": "32423423",
      "amount": "100",
      "currency": "ETB",
      "reference": "3241342142sfdd",
      "bank_code": "fe087651-4910-43af-b666-bbd393d8e81f"
    });

    // Make the POST request
    try {
      print('Transfer start ');
      final dio = Dio();
      final response = await dio.post(
        'https://api.chapa.co/v1/transfers',
        options: Options(headers: headers),
        data: rawPayload,
      );
      print(
          'transfer:${response.data}'); // Assuming you want to print the response data
    } catch (e) {
      print('ErrorCatched: $e');
    }
  }
}








// { "amount":"2", "transaction_type":"deposit"
// }
