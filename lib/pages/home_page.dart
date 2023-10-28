import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/images.jpeg"),fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           SizedBox(height: 300,) ,
            Container(
              //color: Colors.red,
              child: Column(
                
              mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      
                      height: 140,
                      child: Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 150,color: Color(0xff004581),overflow: TextOverflow.visible))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,),
                    child: Text("Calculator",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Color(0xff014783)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0),
                    child: Text("How healthy are you?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color(0xff159bc8))),
                  )
                ],
                
              ),
            ),
            SizedBox(height: 308,),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
  children: [
    Container(
      
      height: 100,
      
      decoration: BoxDecoration(
        color: Color(0xff018abd),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
    ),
    Positioned(
      bottom: 60,
      child: Center(
      child: Container(
        
        height: 100,
        child: MaterialButton(
          color: const Color.fromARGB(255, 10, 56, 101) ,
          //backgroundColor: Colors.blue.shade700,
          shape: CircleBorder(side: BorderSide(width: 7,color: Colors.white),),
        onPressed: () {
          Navigator.pushNamed(context, "/main");
        },
        child: Text(
          "Let's Go",
          style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
        ),
        ),
      ),
      )

    ),
  ],
)


            
          ]),
      ),
    );
  }
}