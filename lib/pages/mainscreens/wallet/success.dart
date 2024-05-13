import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/widgets/buttons.dart';
import 'package:frontend/widgets/layout.dart';
import 'package:get/get.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalSpace(screenSize.height * 0.13),
            // Container(
            //   child: Column(
            //     children: [],
            //   ),
            //   height: 32,
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [primaryColor, whiteColor])),
            // ),
            Text(
              'Deposited To wallet',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Image.asset(width: 150, 'assets/right.png'),
            VerticalSpace(15),
            Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            VerticalSpace(screenSize.height * 0.03),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 5),
              child: Card(
                color: whiteColor,
                elevation: 2,
                // decoration: BoxDecoration(
                //   border: Border.all(color: primaryColor, width: 1),
                //   borderRadius: BorderRadius.circular(15),
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction Type',
                              style: TextStyle(color: grayTextColor),
                            ),
                            Text('Deposite')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction status',
                              style: TextStyle(color: grayTextColor),
                            ),
                            Text(
                              'Successfull',
                              style: TextStyle(
                                  color: Colors.green[400],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction id',
                              style: TextStyle(color: grayTextColor),
                            ),
                            Text(
                              '90nsdfas',
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(color: grayTextColor),
                            ),
                            Text('200')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(color: grayTextColor),
                            ),
                            Text(
                              '1/2/2024',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            VerticalSpace(screenSize.height * 0.09),
            GestureDetector(
                onTap: () {
                  Get.toNamed('wallet');
                },
                child: DefaultButton('Continue', false.obs))
          ],
        ),
      ),
    );
  }
}
