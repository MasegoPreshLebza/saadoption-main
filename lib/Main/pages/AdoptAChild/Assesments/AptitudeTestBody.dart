import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/quiz_screen.dart';

import '../../../../constants.dart';
import '../../../../rounded_button.dart';
import 'Financial Page.dart';
import 'background2.dart';


class AptitudeTestBody extends StatelessWidget with NavigationStates {
  TextEditingController Discipline = new TextEditingController();
  TextEditingController OwnChildren = new TextEditingController();
  TextEditingController ExtendedFamily = new TextEditingController();
  TextEditingController Safety = new TextEditingController();
  TextEditingController values = new TextEditingController();
  TextEditingController Community = new TextEditingController();
  TextEditingController Motive = new TextEditingController();
  TextEditingController confidentiality = new TextEditingController();
  TextEditingController childcareplan = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Background(

      child: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage(
                "assets/images/SA_Adoption_system.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          children: [
            Text(

              "ASSESSMENT",
              style: Theme.of(context).textTheme.headline6.copyWith(color: kPrimaryColor),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Extended Questions. Please answer the following questions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: Discipline,
              decoration: InputDecoration(
                  hintText: "What kind of parents do you see yourself being? How will you discipline your child?*"),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: OwnChildren,
              decoration: InputDecoration(
                hintText:
                    "Do you have a child of your own?\n" + " If your answer is yes,How will you incorporate adoption into your child’s life?\n" + " How will you talk about me and their birth family?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: ExtendedFamily,
              decoration: InputDecoration(
                hintText: "How involved will your extende family be in your child’s life?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: Safety,
              decoration: InputDecoration(
                hintText: "Why is where you live a good place to raise a child?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: values,
              decoration: InputDecoration(
                hintText: "What are your values? Are you religious?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: Community,
              decoration: InputDecoration(
                hintText:
                "What are your home and your community like?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: confidentiality,
              decoration: InputDecoration(
                hintText: "It's fine to keep adoption status\n" + " a secret?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: Motive,
              decoration: InputDecoration(
                hintText:
                "How did you know you wanted to become parents, and why did you decide on adoption?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: childcareplan,
              decoration: InputDecoration(
                hintText: "Will one of you stay home with the baby? If not, what kind of childcare plans do you have?*",
                hintMaxLines: 2,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            RoundedButton(
              text: "SUBMIT ",
              press: () {
                Map<String, dynamic> data = {
                  "Descipline": Discipline.text,
                  "OwnChildren": OwnChildren.text,
                  "ExtendedFamily": ExtendedFamily.text,
                  "Safety": Safety.text,
                  "values":values.text,
                  "Motive":Motive.text,
                  "confidentiality":confidentiality.text,
                  "childcareplan":childcareplan.text,
                  "Community": Community.text,
                };
                FirebaseFirestore.instance.collection("Extended Question").add(data);

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return QuizScreenBody();
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
