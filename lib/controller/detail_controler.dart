import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class DetailControler extends GetxController{
  RxList ticketImage = ['assets/car2.jpg','assets/car2.jpg','assets/a.jpg'].obs;
  RxString PaymentTyle = "Wallet".obs;
  RxList SellectedTicket = [].obs;
  
  void AddRemoveTicket(int number){
    if(SellectedTicket.contains(number)){
      SellectedTicket.remove(number);
    }else{
      SellectedTicket.add(number);
    }
    print(SellectedTicket);
  }

  void changePaymentType(){
    if(PaymentTyle.value == "Wallet" ){
      PaymentTyle.value = "Chapa" ;
    }else{
      PaymentTyle.value = "Wallet" ;
    }
  }

  
  RxList coments = [
    'm ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio.',
    'm ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio.',
    'm ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio.',
    'm ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio.',
    'm ex, at tincidunt ligula blandit nec. Fusce est tortor, molestie id neque ut, convallis rutrum sapien. Vestibulum posuere congue leo. Mauris vel augue odio.',
  ].obs;
  
}