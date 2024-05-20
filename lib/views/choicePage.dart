import 'package:flutter/material.dart';
import 'package:quiz/views/add_questions.dart';
import 'package:quiz/views/dashboard/dashboard.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);
    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(
              color: bgColor3,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.24),
                  blurRadius: 20.0,
                  offset: const Offset(0.0, 10.0),
                  spreadRadius: -10,
                  blurStyle: BlurStyle.outer,
                )
              ],
            ),
            child: Image.asset("assets/dash.png"),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Flex your brain, it's quiz time!",
              style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 21,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 60),
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>AddQuestionScreen()));
              },
              child: Text(
                'Create Your quiz',
                style: TextStyle(color: Colors.white,fontSize: 15),
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 60),
                  backgroundColor: bgColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Dashboard()));

              },
              child: Text(
                'Play Quiz',
                style: TextStyle(color: Colors.white,fontSize: 15),
              )),
        ],
      ),
    );
  }
}
