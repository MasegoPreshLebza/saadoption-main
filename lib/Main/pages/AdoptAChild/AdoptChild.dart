import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';

import 'package:saadoptionsystem/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Assesments/AptitudeTest.dart';
import 'Assesments/background2.dart';

class AdopterPage extends StatelessWidget with NavigationStates {
  TextEditingController FullName = new TextEditingController();
  TextEditingController Ethnicity = new TextEditingController();
  TextEditingController Idnumber = new TextEditingController();
  TextEditingController HomeAdress = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Background(
      
      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "ADOPT A CHILD",
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    "Home Address": HomeAdress.text
                  };
                  FirebaseFirestore.instance.collection("Adopter").add(data);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AptitudeTest();
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

