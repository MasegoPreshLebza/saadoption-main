import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/NewsFeed/news.dart';
import 'package:video_player/video_player.dart';
import 'package:saadoptionsystem/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../constants.dart';
import 'Assesments/AptitudeTest.dart';
import 'Assesments/background2.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdopterPage extends StatefulWidget with NavigationStates {
  @override
  _AdopterPageState createState() => _AdopterPageState();
}


class _AdopterPageState extends State<AdopterPage> {

  TextEditingController FullName = new TextEditingController();
  TextEditingController Ethnicity = new TextEditingController();
  TextEditingController AgeController = new TextEditingController();
   String age;
  TextEditingController HomeAdress = new TextEditingController();
  TextEditingController PreferredAge = new TextEditingController();
  TextEditingController HealthStatus = new TextEditingController();
  TextEditingController Place = new TextEditingController();
  static String videoID = 'j-jLaom-fPc';
  DatabaseReference _ref;

//ethnicity full name and place as linker.
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: videoID,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  void showToast() {
    Fluttertoast.showToast(
        msg: "Report sent",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }


 AgeEligibility() {
    int Actualage = 70;
    int age1 =int.tryParse(age);

    // evaluating age
    if (age1< Actualage) {
      return"YOu are eligible to adopt";}
    else if (age1 > Actualage) {
      return"You are not eligible for adopting";
    }
  }

  @override
  Widget build(BuildContext context) {
    int Actualage = 70;
    AppBar(
      title: Text("ADOPT A CHILD"),
      centerTitle: true,
    );
    return Background(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/SA_Adoption_system.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "ORIENTATION",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: kPrimaryColor),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Welcome.This video will give you the insight on the process of adoption and what you will need to start the process.  It will give you information on time frames and obstacles that may occur. Please watch the video before proceeding.",
                style: TextStyle(fontWeight: FontWeight.bold),

              ),
              SizedBox(
                height: 10.0,
              ),
              YoutubePlayer(
                controller: _controller,
                liveUIColor: Colors.amber,
                showVideoProgressIndicator: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Please enter your personal information below.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "     Note:If you are over the age of 70 you will not be",
                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),
              ),
              Text(
                "    considered.",
                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),
              ),
              TextField(
                controller: FullName,
                decoration: InputDecoration(hintText: "Name and Surname"),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: Ethnicity,
                decoration: InputDecoration(hintText: "Ethnicity"),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                validator: (input) {
                  if (input == age) return 'Error';
                },
                controller: AgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter your Age"),

              ),

              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: PreferredAge,
                decoration: InputDecoration(
                    hintText: "The preferred age of the child you would like?"),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: HealthStatus,
                decoration: InputDecoration(
                    hintText: "Is the health status of the child good or bad? if bad please elaborate."),
                maxLines: 2,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: Place,
                decoration: InputDecoration(
                    hintText: "Where do you stay?Briefly describe the neighbourhood and amenities?"),
                maxLines: 2,
              ),
              SizedBox(
                height: 5.0,
              ),

              RoundedButton(
                text: "SUBMIT",

                press: () { saveUser();
                  Map<String, dynamic> data = {
                    "Full Name": FullName.text,
                    "Ethnicity": Ethnicity.text,
                    "ID number": AgeController.text,
                    "Home Address": HomeAdress.text,
                    "PreferredAge": PreferredAge.text,
                    "AgeParent": HealthStatus.text,
                    "Place": Place.text,
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
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('AdoptAChild');
  }
  saveUser() {
    String fullName = FullName.text;
    String ethnicity= Ethnicity.text;
    String preferredAge = PreferredAge.text;
    String place = Place.text;


    Map<String, dynamic> storeStaff = {

      'Full Name':fullName,
      'Ethnicity': ethnicity,
      'PreferredAge': preferredAge,
      'Place':place,



    };
    _ref.push().set(storeStaff).then((value) {
      setState(() {

      });
    });
  }

}

