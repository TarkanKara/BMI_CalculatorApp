import 'package:bmi_calculator_app/CalculateBMI.dart';
import 'package:bmi_calculator_app/your_page.dart';
import 'package:flutter/material.dart';

//Methods
import 'methods/genderSelectedButton.dart';
import 'methods/newShowDialog.dart';
import 'methods/newTextField.dart';

enum Genderselected { female, male, other }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double yas = 0;
  double height = 0;
  double weight = 0;
  double ort = 0;
  Genderselected? selected;
  final Color activeColor = Colors.black54;
  final Color inactiveColor = Colors.white;
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Calculate \nyour current BMI",
              style: TextStyle(
                color: Color(0xff454545),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  Text(
                    "You can find out whether you are \noverweight, underweight or ideal weight",
                    style: TextStyle(
                      color: Color(0xff686868),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                genderSelectedButton(
                  "Female",
                  () {
                    setState(() {
                      selected = Genderselected.female;
                    });
                    //print("Tıklandı1");
                  },
                  selected == Genderselected.female
                      ? activeColor
                      : inactiveColor,
                ),
                genderSelectedButton(
                  "Male",
                  () {
                    setState(() {
                      selected = Genderselected.male;
                    });
                    //print("Tıklandı2");
                  },
                  selected == Genderselected.male ? activeColor : inactiveColor,
                ),
                genderSelectedButton(
                  "Other",
                  () {
                    setState(() {
                      selected = Genderselected.other;
                      //print("Tıklandı3");
                    });
                  },
                  selected == Genderselected.other
                      ? activeColor
                      : inactiveColor,
                ),
              ],
            ),
            const SizedBox(height: 50),
            newTextField(
              ageController,
              " ",
              "Age",
            ),
            const SizedBox(height: 20),
            newTextField(
              heightController,
              "Cm",
              "Height",
            ),
            const SizedBox(height: 20),
            newTextField(
              weightController,
              "Kg",
              "Weight",
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (ageController.text.isEmpty ||
                    heightController.text.isEmpty ||
                    weightController.text.isEmpty) {
                  newShowDialog(
                    context,
                    "HATA!!!",
                    "Lütfen Tüm Değerleri girdiğinizden emin olunuz...",
                    "Tamam",
                  );
                } else {
                  yas = double.parse(ageController.text);
                  if (yas >= 0 && yas <= 110) {
                    height = double.parse(heightController.text);

                    if (height >= 50 && height <= 220) {
                      weight = double.parse(weightController.text);

                      if (weight > 50 && weight <= 300) {
                        CalculateBMI calculateBMI =
                            CalculateBMI(height: height, weight: weight);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YourPage(
                              bmi: calculateBMI.calculateBMI(),
                              resultt: calculateBMI.getResult(),
                              feddback: calculateBMI.feedBack(),
                            ),
                          ),
                        );
                      } else {
                        newShowDialog(
                          context,
                          "HATALI Kilo Aralığı",
                          "50 ile 300 Kg Arası bir Değer giriniz.",
                          "Tamam",
                        );
                      }
                    } else {
                      newShowDialog(
                          context,
                          "HATALI Boy Uzunluğu",
                          "50 cm ile 220 cm aralığı bir boy uzunluğu giriniz.",
                          "Tamam");
                    }
                  } else {
                    newShowDialog(
                      context,
                      "HATALI Yaş Aralığı",
                      "0 ile 110 arası bir yaş aralığı giriniz",
                      "Tamam",
                    );
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
