import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/screens/results.dart';
import 'package:saadoptionsystem/Main/pages/NewsFeed/news.dart';
import 'dart:io';
import '../../../rounded_button.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AbondonedChildPage extends StatefulWidget with NavigationStates {
  @override
  _AbondonedChildPageState createState() => _AbondonedChildPageState();
}

class _AbondonedChildPageState extends State<AbondonedChildPage> {
  var formKey = GlobalKey<FormState>();
  String eng, phy, math, sci, geo;
  TextEditingController dates = new TextEditingController();
  TextEditingController detailss = new TextEditingController();
  TextEditingController names = new TextEditingController();
  TextEditingController ages = new TextEditingController();
  TextEditingController contactnumbers = new TextEditingController();
  CollectionReference imgRef;
  DatabaseReference _ref;
  File _image;
  mail() async {
    String username = 'masegopreciousmmotlana@gmail.com';
    String password = 'Masego@0746461009';

    final smtpServer = gmail(username, password);


    // Create message.
    final message = Message()
      ..from = Address(username, 'Masego')
      ..recipients.add('masegopreciousmmotlana@gmail.com')
      ..ccRecipients.addAll(['masegopreciousmmotlana@gmail.com', 'masegopreciousmmotlana@gmail.com'])
      ..bccRecipients.add(Address('masegopreciousmmotlana@gmail.com'))
      ..subject = 'Abandoned Child:  ${DateTime.now()}'
      ..text = 'A child has been reported abandoned by the Catholic womens league adoption agency.\nPlease contact them on these details- 011 618 1533\n Or Pregnancy Crisis Service: 061 925 1987'
      ..html = "<h1>Good Day</h1>\n<p>A child has been reported abandoned by the Catholic womens league adoption agency.\nPlease contact them on these details- 011 618 1533\n Or Pregnancy Crisis Service: 061 925 1987</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }




  }
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async {
      String url;
      String fileName = basename(_image.path);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(
          fileName);
      Task uploadTask = firebaseStorageRef.putFile(_image);
      uploadTask.whenComplete(() async {
        await firebaseStorageRef.getDownloadURL().then((value) {
          imgRef.add({'url': value});
          setState(() {
            print("Profile Picture uploaded");
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Profile Picture Uploaded')));
          });
        }).catchError((onError) {
          print('Image not saved.');
        });
        return url;
      }
      );
    }
    return Scaffold(

      appBar: AppBar(
        title: Text('Report Abandoned Child'),
      ),
      body: Builder(
        builder: (context) =>  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage(
                  "assets/images/SA_Adoption_system.png"),
              fit: BoxFit.cover,
            ),
          ),
      child:SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        SizedBox(
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Color(0xFFFCFCFC),
              child: ClipOval(
                child: new SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: (_image!=null)?Image.file(
                    _image,
                    fit: BoxFit.fill,
                  ):Image.asset(
                    "assets/default.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.camera,
                size: 50.0,
                  color:Colors.green
              ),
              onPressed: () {
                getImage();
              },
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10.0,
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: names,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Please enter name of the child',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'please enter name of the child';
                    } else {
                      eng = text;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ages,
                  decoration: InputDecoration(
                      hintText: 'Age',
                      labelText: 'Age of the child',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'please enter age';
                    } else {
                      phy = text;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: dates,
                  decoration: InputDecoration(
                      hintText: 'Last day',
                      labelText: 'Where did you find the child?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'please provide the date';
                    } else {
                      math = text;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: detailss,
                  decoration: InputDecoration(
                      hintText: 'Outfit',
                      labelText: 'What is she/he wearing?',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'please provide details';
                    } else {
                      sci = text;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: contactnumbers,
                  decoration: InputDecoration(
                      hintText: 'Contact numbers',
                      labelText: 'Enter contact numbers',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  validator: (text) {
                    if (text.isEmpty) {
                      return 'please provide details required';
                    } else {
                      geo = text;
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),

                SizedBox(
                  width: 16,
                ),

              ],
            ),

          ),
        ),

      ),

      ),
          RoundedButton(
            text: "REPORT",
            color:Colors.green,
            press: () {mail();saveUser();
            showToast();uploadPic(context);
                Navigator.of(context).pop();
            Map<String, dynamic> data = {
              "Date": dates.text,
              "Contactnumber": contactnumbers.text,
              "Detials of Missing child": detailss.text,
              "Age of child": ages.text,
              "Name of the child":names.text,
            };
            FirebaseFirestore.instance.collection("Abandoned child reported").add(data);
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
    return NewsFeedScreen();
    }),
    );
    },
          ),
          SizedBox(height: 70),
          Text(
            "By clicking REPORT your E-mail will be sent to the SAPS",
            style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),
          ),
          SizedBox(height: 22),
    ],

    ),
    ),
    ),
      ),
    );
  }
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

  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
    _ref = FirebaseDatabase.instance.reference().child('Abandonedchildren');
  }

  saveUser() {
    String date = detailss.text;
    String contactnumber = contactnumbers.text;
    String detialsofMissingchild = detailss.text;
    String nameofthechild = names.text;


    Map<String, dynamic> storeStaff = {

      'Date':date,
      'Contactnumber': contactnumber,
      'Detials of Missing child': detialsofMissingchild,
      'nameofthechild':nameofthechild,


    };
    _ref.push().set(storeStaff).then((value) {
      setState(() {

      });
    });
  }

}
