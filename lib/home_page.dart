import 'package:bmi_calculator_app/CalculateBMI.dart';
import 'package:bmi_calculator_app/your_page.dart';
import 'package:flutter/material.dart';

//Methods
import 'methods/genderSelectedButton.dart';
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
  final age_controller = TextEditingController();
  final height_controller = TextEditingController();
  final weight_controller = TextEditingController();

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
            newTextField(
              age_controller,
              " ",
              "Age",
            ),
            SizedBox(height: 20),
            newTextField(
              height_controller,
              "Cm",
              "Height",
            ),
            SizedBox(height: 20),
            newTextField(
              weight_controller,
              "Kg",
              "Weight",
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                yas = double.parse(age_controller.text);
                height = double.parse(height_controller.text);
                weight = double.parse(weight_controller.text);
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
}
