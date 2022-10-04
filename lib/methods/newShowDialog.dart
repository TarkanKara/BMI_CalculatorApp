import 'package:flutter/material.dart';

Future<dynamic> newShowDialog(BuildContext context, String titlee,
    String listBodyTitle, String buttonTitle) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          titlee,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                listBodyTitle,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
          )
        ],
      );
    },
  );
}
