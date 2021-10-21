import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saadoptionsystem/Login/Login.dart';
import '../rounded_button.dart';
import 'package:dropdownfield/dropdownfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Name = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController PhoneNumber = new TextEditingController();
  TextEditingController Option = new TextEditingController();
  DatabaseReference _ref;
  String _name, _email, _password, _phone;
  String valueChoose="";
  String valuePick="";
  bool onChanged = false;
  List <String> listItem = ["Adopt a child", "Give up a child for adoption", "Report a missing/abandoned child"];

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {}
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    _ref = FirebaseDatabase.instance.reference().child('Users');
  }


  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),

            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextFormField(
                              controller: Name,
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Name';
                              },
                              decoration: InputDecoration(
                                labelText: 'Name',
                                prefixIcon: Icon(Icons.person),
                              ),
                              onSaved: (input) => _name = input),
                        ),
                        Container(
                          child: TextFormField(
                              controller: Email,
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Email';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                              onSaved: (input) => _email = input),
                        ),
                        Container(
                          child: TextFormField(
                              controller: PhoneNumber,
                              validator: (input) {
                                if (input.isEmpty) return 'Enter Phone Number';
                              },
                              decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  prefixIcon: Icon(Icons.phone)),
                              onSaved: (input) => _phone = input),
                        ),
                        Container(
                          child: TextFormField(
                              validator: (input) {
                                if (input.length < 6)
                                  return 'Provide Minimum 6 Character';
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                              obscureText: true,
                              onSaved: (input) => _password = input),
                        ),
                        SizedBox(height: 20),

                  DropDownField(
                            controller:Option,
                            hintText:"Select Reason",
                              enabled:true,
                            itemsVisibleInDropdown:3,
                            items: listItem,
                            onValueChanged:(newValue){
                              setState((){
                            valueChoose= newValue;
                              });

                            },
                          ),


                        SizedBox(height: 20),
                        RoundedButton(text: "SIGN UP", press: () {
                          saveUser();
                          signUp();
                        })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }


  saveUser() {
    String name = Name.text;
    String email = Email.text;
    String phonenumber = PhoneNumber.text;
    String option = Option.text;


    Map<String, dynamic> storeStaff = {

      'Name': name,
      'PhoneNumber': phonenumber,
      'Email': email,
      'Category':option,


    };
    _ref.push().set(storeStaff).then((value) {
      setState(() {

      });
    });
  }
}
