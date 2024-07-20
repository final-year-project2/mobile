import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  CustomErrorWidget({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.error_outline, color: Colors.red, size: 50.0),
          SizedBox(height: 10.0),
          Text(
            'Error Occurred!',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(errorMessage,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}

class NetworkException extends StatelessWidget {
  final String errorMessage;
  NetworkException({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 84, 81, 81)),
      child: Row(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              errorMessage,
              style: TextStyle(color: whiteColor),
            ),
          ),
        )
      ]),
    );
  }
}
