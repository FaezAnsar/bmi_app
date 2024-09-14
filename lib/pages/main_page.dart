import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

int currentValue_ft = 5;
int currentValue2_in = 6;
int currentValue_m = 1;
int currentValue2_cm = 20;
bool inches = true;
String selectedValue = "inches";
String weightselectedValue = "lbs";
TextEditingController textcontroller1 = TextEditingController();
TextEditingController textcontroller2 = TextEditingController();

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //bool which changes acc to height unit selected
  late int var1;
  late int var2;
  bool showError = false;

  bool malePressed = false;
  bool femalePressed = false;
  FocusNode focus = FocusNode();
  FocusNode focus2 = FocusNode();

  void closeKeypad() {
    focus.unfocus();
    focus2.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeypad,
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          centerTitle: false,
          backgroundColor: Color(0xFF94F3FF),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/images.jpeg"), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(20),
                            child: GestureDetector(
                              onTap: () {
                                closeKeypad();
                                setState(() {
                                  malePressed = true;
                                  femalePressed = false;
                                });
                              },
                              child: Container(
                                height: 150,
                                width: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.black,
                                        style: (malePressed)
                                            ? BorderStyle.solid
                                            : BorderStyle.none)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Icon(
                                        Icons.male,
                                        size: 100,
                                        color: const Color.fromARGB(
                                            255, 174, 78, 43),
                                      ),
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(width: 30,),
                          Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(20),
                            child: GestureDetector(
                              onTap: () {
                                closeKeypad();
                                setState(() {
                                  malePressed = false;
                                  femalePressed = true;
                                });
                              },
                              child: Container(
                                height: 150,
                                width: 170,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.black,
                                        style: (femalePressed)
                                            ? BorderStyle.solid
                                            : BorderStyle.none)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Icon(
                                        Icons.female,
                                        size: 100,
                                        color: const Color.fromARGB(
                                            255, 174, 78, 43),
                                      ),
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  //       NumberPicker(
                  //     value: _currentValue,
                  //     minValue: 1,
                  //     maxValue: 10,
                  //     step: 1,
                  //     onChanged: (value) => setState(() => _currentValue = value),
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          //Icon(Icons.female,size: 100,color: const Color.fromARGB(255, 174, 78, 43),),
                          //Text("Height",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          DropdownButton<String>(
                            value: selectedValue,
                            onChanged: (newValue) {
                              closeKeypad();
                              setState(() {
                                if (selectedValue != newValue) {
                                  selectedValue = newValue!;
                                  inches = (selectedValue == "inches")
                                      ? true
                                      : false;
                                  if (inches) {
                                    currentValue_ft = 5;
                                    currentValue2_in = 6;
                                  } else {
                                    currentValue_m = 1;
                                    currentValue2_cm = 20;
                                  }
                                }
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                  value: "inches",
                                  child: Text('Height(inches)')),
                              DropdownMenuItem(
                                  value: 'meters',
                                  child: Text('Height(meters)')),
                              //DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(children: [
                                NumberPicker(
                                    infiniteLoop: true,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                color: Colors.black))),
                                    value: (inches)
                                        ? currentValue_ft
                                        : currentValue_m,
                                    minValue: (inches) ? 1 : 0,
                                    maxValue: (inches) ? 7 : 2,
                                    step: 1,
                                    onChanged: (value) {
                                      closeKeypad();
                                      setState(() => (inches)
                                          ? currentValue_ft = value
                                          : currentValue_m = value);
                                    }),
                                Positioned(
                                    left: 80,
                                    top: 67,
                                    child: Text((inches) ? "ft" : "m"))
                              ]),
                              Stack(children: [
                                NumberPicker(
                                    infiniteLoop: true,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                color: Colors.black))),
                                    value: (inches)
                                        ? currentValue2_in
                                        : currentValue2_cm,
                                    minValue: 0,
                                    maxValue: (inches) ? 12 : 99,
                                    step: 1,
                                    onChanged: (value) {
                                      closeKeypad();
                                      setState(() => (inches)
                                          ? currentValue2_in = value
                                          : currentValue2_cm = value);
                                    }),
                                Positioned(
                                    left: 80,
                                    top: 67,
                                    child: Text((inches) ? "in" : "cm"))
                              ]),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 190,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              DropdownButton<String>(
                                value: weightselectedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    if (weightselectedValue != newValue) {
                                      weightselectedValue = newValue!;
                                      if (weightselectedValue == "kgs") {
                                        textcontroller1.text =
                                            ((int.parse(textcontroller1.text) ~/
                                                    2.25)
                                                .toString());
                                      } else if (weightselectedValue == "lbs") {
                                        textcontroller1.text =
                                            ((int.parse(textcontroller1.text) *
                                                    2.25)
                                                .roundToDouble()
                                                .toInt()
                                                .toString());
                                      }
                                    }
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                      value: "lbs", child: Text('Weight(lbs)')),
                                  DropdownMenuItem(
                                      value: 'kgs', child: Text('Weight(Kg)')),
                                ],
                              ),
                              //SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: TextField(
                                    controller: textcontroller1,
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: const Color.fromARGB(
                                            255, 1, 77, 154)),
                                    textAlign: TextAlign.center,
                                    focusNode: focus,

                                    //controller: textController,
                                    keyboardType: TextInputType
                                        .number, // Use TextInputType.number for the number keyboard
                                    decoration: InputDecoration(
                                      hintText: 'Enter a Number',
                                      hintStyle: TextStyle(fontSize: 15),
                                      border: UnderlineInputBorder(
                                        // Use UnderlineInputBorder for no line or customize it
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          //style: BorderStyle.n// Set to transparent to remove the line
                                        ),
                                      ),
                                    ),
                                    // onSubmitted: (value) => focus.unfocus(),
                                    //
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 190,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Age"),
                                SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: TextField(
                                      showCursor: true,

                                      controller: textcontroller2,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: const Color.fromARGB(
                                              255, 1, 77, 154)),
                                      textAlign: TextAlign.center,
                                      focusNode: focus2,

                                      //controller: textController,
                                      keyboardType: TextInputType
                                          .number, // Use TextInputType.number for the number keyboard
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 15),
                                        hintText: 'Enter a Number',
                                        border: UnderlineInputBorder(
                                          // Use UnderlineInputBorder for no line or customize it
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                            //style: BorderStyle.n// Set to transparent to remove the line
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //Text("Female",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //        AnimatedOpacity(
                  //   duration: Duration(milliseconds: 500), // Adjust the duration as needed
                  //   opacity: showError ? 1.0 : 0.0,
                  //   child: Text(
                  //     'Invalid input. Enter a number between 1 and 100.',
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // ),
                  SizedBox(
                    height: 81,
                  ),

                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                            color: Color(0xff018abd),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                      ),
                      Positioned(
                          bottom: 30,
                          child: Center(
                            child: Container(
                              height: 100,
                              child: MaterialButton(
                                color: const Color.fromARGB(255, 10, 56, 101),
                                //backgroundColor: Colors.blue.shade700,
                                shape: CircleBorder(
                                  side:
                                      BorderSide(width: 7, color: Colors.white),
                                ),
                                onPressed: () {
                                  var1 = (textcontroller1.text.isNotEmpty)
                                      ? int.parse(textcontroller1.text)
                                      : 0;
                                  var2 = (textcontroller2.text.isNotEmpty)
                                      ? int.parse(textcontroller2.text)
                                      : 0;
                                  print("s$var1");
                                  if (var1 <= 0 || var1 > 225) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Invalid input. Enter a number between 1 and 225.'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the popup
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (var2 <= 0 || var2 > 100) {
                                    // Display an error popup
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(
                                              'Invalid input. Enter a number between 1 and 100.'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close the popup
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    // Continue with your desired action
                                    Navigator.pushNamed(context, '/final');
                                  }
                                },
                                child: Text(
                                  "BMI",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
