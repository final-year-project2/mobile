import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:frontend/pages/authentication/categories.dart';
import 'package:frontend/services/http_services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class WalletController extends GetxController {
  HttpServices? httpServices;

  RxInt walletAmount = 0.obs;
  final tokenBox = GetStorage();
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
  Future<void> addMoneyToWallet(BuildContext context) async {
    try {
      String txRef = TxRefRandomGenerator.generate(prefix: 'Pharmabet');
      String storedTxRef = TxRefRandomGenerator.gettxRef;
      print('Generated TxRef: $txRef');
      print('Stored TxRef: $storedTxRef');
      String? paymentUrl = await Chapa.getInstance.startPayment(
          callbackUrl:
              "https://api.chapa.co/v1/transaction/verify/$storedTxRef",
          context: context,
          txRef: storedTxRef,
          amount: '100',
          currency: 'ETB',
          enableInAppPayment: true,
          onInAppPaymentSuccess: (successMsg) async {
            print('successMsg $successMsg');
            //verify the payment fucntion run
            Map<String, dynamic> verificationResult =
                await Chapa.getInstance.verifyPayment(
              txRef: storedTxRef ?? '',
            );

            verificationResult.values.forEach((element) {
              print(element);
            });

            int? walletMoney = verificationResult['data']['amount'];

            print('walletM:$walletMoney');
            walletAmount.value = walletMoney ?? 0;
            print('WalletControllerAmount:$walletAmount');
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

  Future<dio.Response> updateWalletForDeposit() async {
    final walletId = tokenBox.read('walletId');
    print("Wallet id $walletId");
    try {
      final response = await httpServices!.postRequest('/user/updateWallet/5',
          {"amount": "100", "transaction_type": "deposit"});

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
}
