import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/constant.dart';
import 'package:flutter/gestures.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/person1.png'),
          VerticalSpace(50),
          Text(
            'LOGO',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: goldenColor, fontSize: 23),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Text(
              'Unlock the Unseen, Win the Prize',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 29,
                color: grayTextColor,
              ),
            ),
          ),
          DefaultButton('Browse Prize'),
          VerticalSpace(28),
          Container(
            height: 49,
            width: 342,
            decoration: BoxDecoration(
                border: Border.all(color: goldenColor),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
              'Sign in',
              style: TextStyle(
                  color: goldenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          VerticalSpace(30),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: HorizontalLine(height: 1, width: 120),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text('or'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: HorizontalLine(height: 1, width: 120),
              ),
            ],
          ),
          VerticalSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              HorizontalSpace(5),
              Text(
                'Sign up',
                style: TextStyle(color: goldenColor),
              ),
            ],
          ),
          VerticalSpace(20),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' By continuing you are agree with the xxxxx  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: fotterTextColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: 'Terms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: goldenColor)),
                    TextSpan(
                        text: ' and  ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: fotterTextColor)),
                    TextSpan(
                        text: ' Policy notice ',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: goldenColor))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
