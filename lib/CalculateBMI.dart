import 'dart:math';

import 'package:flutter/material.dart';

class CalculateBMI {
  final double height;
  final double weight;

  CalculateBMI({required this.height, required this.weight});

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(2, height / 100);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.50) {
      return ("AŞIRI ZAYIF");
    } else if (_bmi >= 18.50 && _bmi <= 24.90) {
      return ("NORMAL");
    } else if (_bmi > 24.90 && _bmi <= 29.50) {
      return ("ŞİŞMAN");
    } else if (_bmi > 29.50 && _bmi <= 39.90) {
      return ("OBEZİTE");
    } else {
      return ("YÜKSEK OBEZİTE");
    }
  }

  String feedBack() {
    if (_bmi < 18.50) {
      return ("Aşırı Zayıfsınız Yemek Yiyi");
    } else if (_bmi >= 18.50 && _bmi <= 24.90) {
      return ("Kilonuz ideal");
    } else if (_bmi > 24.90 && _bmi <= 29.50) {
      return ("Hafif Kilo verebilirsiniz");
    } else if (_bmi > 29.50 && _bmi <= 39.90) {
      return ("Çok fazla Kilon var. Spora Gidebilirsin");
    } else {
      return ("Aşırı Kilon var,hastalık yapabilir. Acil bir diyetisyenle görüşmelisin");
    }
  }
}
