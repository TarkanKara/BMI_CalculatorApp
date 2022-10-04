 import 'package:flutter/material.dart';

GestureDetector genderSelectedButton(
      String text, Function() onTap, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Text(text),
      ),
    );
  }