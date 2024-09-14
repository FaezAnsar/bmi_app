import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/images.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 300,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      height: 140,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "BMI",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 150,
                              color: Color(0xff004581),
                              overflow: TextOverflow.visible),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Calculator",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Color(0xff014783)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "How healthy are you?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff159bc8)),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip
                  .none, // This allows the button to overflow the bottom container
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xff018abd),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  top:
                      -50, // Adjust to raise the button above the bottom container
                  child: Container(
                    height: 100,
                    child: MaterialButton(
                      color: const Color.fromARGB(255, 10, 56, 101),
                      shape: const CircleBorder(
                        side: BorderSide(width: 7, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/main");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
