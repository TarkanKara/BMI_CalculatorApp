import 'dart:math';

class CalculateBMI {
  final double height;
  final double weight;

  CalculateBMI({required this.height, required this.weight});

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(2, (height / 100));
    return _bmi.toStringAsFixed(2);
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
      return ("Bu durum yağ oranınızın, kas kütlenizin azlığı ve çokluğu ile pek alakalı değil. Boyunuza göre kilonuz fazla düşük demektir.");
    } else if (_bmi >= 18.50 && _bmi <= 24.90) {
      return ("BMI boyunuza göre kilonuzun gayet iyi durumda olduğunu söylüyor. Harika!");
    } else if (_bmi > 24.90 && _bmi <= 29.50) {
      return ("Vücut kitle indeksiniz 25’in üstünde çıktıysa bu hesaplamaya göre kilolusunuz demektir.Hafif Kilo verebilirsiniz");
    } else if (_bmi > 29.50 && _bmi <= 39.90) {
      return ("Bu noktada profesyonel vücut geliştirme, güreş gibi bir spor yapmıyorsanız sağlığınız neredeyse kesin olarak tehdit altında demektir. Çok fazla Kilon var. Spora Gidebilirsin");
    } else {
      return ("Aşırı Kilon var,hastalık yapabilir. Acil bir diyetisyenle görüşmelisin");
    }
  }
}
