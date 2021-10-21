import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/background2.dart';
import 'package:saadoptionsystem/Main/pages/GivingUpAChild/AptitudeTestGiveUp.dart';

import 'package:saadoptionsystem/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants.dart';



class GiveUpAChild extends StatefulWidget with NavigationStates {
  @override
  _GiveUpAChildState  createState() => _GiveUpAChildState();
}


class _GiveUpAChildState extends State<GiveUpAChild> {
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
  DatabaseReference _ref;
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
                style: Theme.of(context).textTheme.headline6.copyWith(color: kPrimaryColor),
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
                decoration: InputDecoration(hintText: "Home Address"),
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
                  hintText: "Where do you stay?Briefly describe the neighbourhood and amenities?*",
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
                press: () { saveUser();
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
                  FirebaseFirestore.instance.collection("Give up a child").add(data);
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
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('GiveUpAChild');
  }
  saveUser() {
    String fullName = FullName.text;
    String ethnicity= Ethnicity.text;
    String agechild = AgeChild.text;
    String homeAddress = HomeAdress.text;


    Map<String, dynamic> storeStaff = {

      'Full Name':fullName,
      'Ethnicity': ethnicity,
      'AgeChild': agechild,
      'HomeAddress':homeAddress,




    };
    _ref.push().set(storeStaff).then((value) {
      setState(() {

      });
    });
  }

}
