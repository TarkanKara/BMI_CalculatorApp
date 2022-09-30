import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double yas = 0;
  double height = 0;
  double weight = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
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
                button("Female"),
                button("Male"),
                button("Other"),
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
                  //print(yas);
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
                //print(height);
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
                //print(weight);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  GestureDetector button(String Textt) {
    return GestureDetector(
      onTap: () {
        print("Button Tıklandı!");
      },
      child: Container(
        width: 100,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Text(Textt),
      ),
    );
  }
}
