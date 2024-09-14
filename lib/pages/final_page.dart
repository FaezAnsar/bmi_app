import 'dart:math';

import 'package:bmi_app/pages/main_page.dart';
import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  FinalPage({super.key});

  String get bmiStatus {
    if (double.parse(bmi.toStringAsPrecision(3)) < 18.5)
      return "UnderWeight";
    else if (double.parse(bmi.toStringAsPrecision(3)) < 25.0)
      return "Normal";
    else
      return "OverWeight";
  }

  double get bmi {
    if (inches) {
      if (weightselectedValue == 'kg')
        return weight / pow(0.0254 * Height, 2);
      else
        return (weight / 2.20462) / pow(0.0254 * Height, 2);
    } else {
      if (weightselectedValue == 'kg')
        return weight / pow(Height, 2);
      else
        return (weight / 2.20462) / pow(Height, 2);
    }
  }

  final int weight = int.parse(textcontroller1.text);
  double get Height {
    if (inches) {
      return (currentValue_ft * 12 + currentValue2_in).toDouble();
    } else
      return currentValue_m + currentValue2_cm / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb1e5ef),
      appBar: AppBar(
        title: Text("Result"),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
            //image: DecorationImage(
            //image: AssetImage("images/images.jpeg"),fit: BoxFit.cover
            // )
            ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    //height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent),
                    child: Text(
                      "WEIGHT",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 54,
                    width: 100,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            "${weight}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          "${weightselectedValue}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    //height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffdde8f0)),
                    child: Text("HEIGHT", style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 54,
                    width: 100,
                    child: Column(
                      children: [
                        Expanded(
                          child: Text(
                            (inches) ? "${Height.toInt()}" : "$Height",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Text(
                          "$selectedValue",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    //height: 100,

                    decoration: BoxDecoration(
                        color: Color(0xff018abd),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ),
                  Positioned(
                      top: -40,
                      // bottom: 60,
                      child: Center(
                        child: Container(
                          height: 100,
                          child: MaterialButton(
                              color: const Color.fromARGB(255, 10, 56, 101),
                              //backgroundColor: Colors.blue.shade700,
                              shape: CircleBorder(
                                side: BorderSide(width: 7, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/main");
                              },
                              child: Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 50,
                              )),
                        ),
                      )),
                  Positioned(
                    top: 70,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${bmi.toStringAsPrecision(3)}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromARGB(
                                              255, 10, 56, 101),
                                          fontSize: 55),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "BMI",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Color.fromARGB(
                                                  255, 8, 167, 225)),
                                        ),
                                        Text(
                                          "${bmiStatus}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 10, 56, 101),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Underweight",
                                    style: TextStyle(
                                        color: Colors.blue.shade500,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Normal",
                                    style: TextStyle(
                                        color: Colors.green.shade500,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "      Overweight",
                                    style: TextStyle(
                                        color: Colors.red.shade500,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MultiColoredLabelBar(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("  16.0"),
                                  Text("18.5"),
                                  Text("25.0"),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text("40.0"),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Positioned(
                      top: 300,
                      child: Container(
                          width: 300,
                          //height: 100,
                          child: Text(
                              textAlign: TextAlign.center,
                              " Your BMI result indicates your current health status based on your height and weight. Maintaining a healthy BMI is important for overall well-being. Please consult a healthcare professional for personalized advice.")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MultiColoredLabelBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10, // Adjust the height as needed
      child: Row(
        children: [
          //allows for more dynamic layout instead of fixing height of containera
          Expanded(
            flex: 3, //decides distribution of same among children
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Center(
                child: Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Center(
                child: Text('', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
