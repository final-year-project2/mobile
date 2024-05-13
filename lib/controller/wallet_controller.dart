import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:frontend/models/wallet_model.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class WalletController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    final responseBalance = await getWalletInformations();
    walletAmount.value = responseBalance.balance;
  }

  HttpServices? httpServices;
  RxBool walletInfoIsLoading = true.obs;
  RxBool chapaWebViewIsLoading = false.obs;
  Map<String, dynamic>? verificationResult;
  RxString walletAmount = ''.obs;
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
    httpServices?.init();
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

            verificationResult?.values.forEach((element) {
              print('element$element');
            });

            int? walletMoney = verificationResult?['data']['amount'];

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
      throw Exception(e);
    }
  }
}







// { "amount":"2", "transaction_type":"deposit"
// }