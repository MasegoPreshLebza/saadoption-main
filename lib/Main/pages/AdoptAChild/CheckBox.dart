import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:saadoptionsystem/Splash/background.dart';

import 'package:saadoptionsystem/rounded_button.dart';

import 'AdoptersScreen.dart';
import 'license_custom_page.dart';

class CheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckBoxWidget();
  }
}

class CheckBoxWidget extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(

      child: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "TERMS AND CONDITIONS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
        Image.asset(
          'assets/images/logo.png',
          height: size.height * 0.30,
        ),
            SizedBox(height: 20),
            buildButton(
              text: 'Terms of Use And Privacy Policy',
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LicensesCustomPage(),
                ),
              ),
            ),
            Text(
              "Accept Terms",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool b) {
                      setState(() {
                        isChecked = b;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child:
                        Text("I have read and accept terms\n and conditions."),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 32),
                child: RoundedButton(
                  text: "CONTINUE",
                  press: isChecked ? displayMessage : null,
                )),
          ],
        ),
      ),
    );
  }

  void displayMessage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog dialog = AlertDialog(
            content: Text("You have accepted the terms."),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AdoptersScreen();
                    }),
                  );
                },
              ),
            ],
          );
          return dialog;
        });
  }

  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        child: Text(text, style: TextStyle(fontSize: 20)),
        onPressed: onClicked,
      );
}
