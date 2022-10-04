import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField newTextField(
      TextEditingController controllerr, String suffixtext, String hinttext) {
    return TextField(
      controller: controllerr,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        suffixText: suffixtext,
        hintText: hinttext,
      ),
      onChanged: (value) {},
    );
  }