import 'dart:math';

import 'package:bmi_calculator_app/CalculateBMI.dart';
import 'package:bmi_calculator_app/your_page.dart';
import 'package:flutter/material.dart';

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
            Text(
              "Let's Calculate \nyour current BMI",
              style: TextStyle(
                color: Color(0xff454545),
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
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
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GenderselectedButton(
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
                GenderselectedButton(
                  "Male",
                  () {
                    setState(() {
                      selected = Genderselected.male;
                    });
                    //print("Tıklandı2");
                  },
                  selected == Genderselected.male ? activeColor : inactiveColor,
                ),
                GenderselectedButton(
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
            SizedBox(height: 50),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Age",
              ),
              onChanged: (value) {
                setState(() {
                  yas = double.parse(value);
                  print(yas);
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixText: "cm",
                hintText: "Height",
              ),
              onChanged: (value) {
                height = double.parse(value);
                print(height);
              },
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Weight",
                suffixText: "kg",
              ),
              onChanged: (value) {
                weight = double.parse(value);
                print(weight);
              },
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                ort = weight / pow(2, (height / 100));
                print(ort);
                CalculateBMI calculateBMI =
                    new CalculateBMI(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourPage(
                        bmi: calculateBMI.calculateBMI(),
                        resultt: calculateBMI.getResult(),
                        feddback: calculateBMI.feedBack(),
                      ),
                    ));
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
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
                decoration: BoxDecoration(
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

  GestureDetector GenderselectedButton(
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
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Text(text),
      ),
    );
  }
}
