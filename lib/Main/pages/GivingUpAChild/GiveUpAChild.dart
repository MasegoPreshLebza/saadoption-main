import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/background2.dart';
import 'package:saadoptionsystem/Main/pages/GivingUpAChild/AptitudeTestGiveUp.dart';

import 'package:saadoptionsystem/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class GiveUpAChild extends StatelessWidget with NavigationStates {
  TextEditingController FullName = new TextEditingController();
  TextEditingController Ethnicity = new TextEditingController();
  TextEditingController Idnumber = new TextEditingController();
  TextEditingController HomeAdress = new TextEditingController();
  TextEditingController Decision = new TextEditingController();
  TextEditingController Drugs = new TextEditingController();
  TextEditingController AgeChild = new TextEditingController();
  TextEditingController AgeParent = new TextEditingController();
  TextEditingController BirthPlace = new TextEditingController();
  TextEditingController neighbourhood = new TextEditingController();
  TextEditingController history = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Background(

      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "PARENT AND GUARDIAN QUESTIONS AND INSTRUCTIONS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                " ",
              ),
              Text(
                " ",
              ),
              TextField(
                controller: FullName,
                decoration: InputDecoration(hintText: "Name and Surname"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: Ethnicity,
                decoration: InputDecoration(hintText: "Ethnicity"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: Idnumber,
                decoration: InputDecoration(hintText: "ID Number"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: HomeAdress,
                decoration: InputDecoration(hintText: "Home Adrress"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration:
                InputDecoration(hintText: "How old is the child?*"),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText:
                  "How old is the Parent/guardian?*",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "The child birth place?*",
                  hintMaxLines: 2,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Briefly describe the neighbourhood and amenities?*",
                  hintMaxLines: 2,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Do both parents know about the decision taken? If yes, what is their take about it?*",
                  hintMaxLines: 3,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(
                text: "UPLOAD DOCUMENTS",
              ),
              RoundedButton(
                text: "SUBMIT",
                press: () {
                  Map<String, dynamic> data = {
                    "Full Name": FullName.text,
                    "Ethnicity": Ethnicity.text,
                    "ID number": Idnumber.text,
                    "Home Address": HomeAdress.text,
                    "AgeChild":AgeChild.text,
                    "AgeParent":AgeParent.text,
                    "BirthPlace":BirthPlace.text,
                    "neighbourhood":neighbourhood.text,
                    "history": history.text,
                  };
                  FirebaseFirestore.instance.collection("Adopter").add(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AptitudeTestGiveUp();
                      },
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }

}
