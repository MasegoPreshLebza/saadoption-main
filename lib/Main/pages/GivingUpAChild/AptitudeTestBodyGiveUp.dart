import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/quiz_screen.dart';
import 'package:saadoptionsystem/Splash/background.dart';
import '../../../../rounded_button.dart';
import 'Financial PageGiveUp.dart';


class AptitudeTestBodyGiveUp extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return Background(

      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          children: [
            Text(
              "APTITUDE TEST",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Home Aspect answer the following questions",
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: "Where is the house situated?*"),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText:
                    "Stipulate a brief descriotion of home and it's composition?*",
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "It's fine to keep adoption status\n" + " a secret?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Briefly describe the neibourhood and amenties?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "How many rooms are there\n" + "is to give birth?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              text: "UPLOAD DOCUMENTS",
            ),
            RoundedButton(
              text: "SUBMIT ",
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FinancialPageGiveUp();
                  },

                ));
              },
            ),
          ],
        )),
      ),
    );
  }
}
