import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/theme/colors/light_colors.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/widgets/active_project_card.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/widgets/task_column.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/widgets/top_container.dart';

import '../../../../../../rounded_button.dart';
import 'calendar_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);


  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.ZDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.ZGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(

      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,

      ),


      body: SafeArea(
      child:Container(
      decoration: BoxDecoration(
       image: DecorationImage(
       image: AssetImage(
    "assets/images/SA_Adoption_system.png"),
    fit: BoxFit.cover,
    ),
    ),

        child: Column(

          children: <Widget>[

            TopContainer(

              height: 100,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Overal Results',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: LightColors.ZDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Remark of all the tasks taken.',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Assessments taken'),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CalendarPage()),
                                  );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: LightColors.ZRed,
                            title: 'Adopt a child page',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: LightColors.ZDarkYellow,
                            title: 'Give up a child page',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: 15.0),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: LightColors.ZBlue,
                            title: 'Report a missing',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Possible match',
                      ),
                          SizedBox(height: 90.0),
                          Row(
                            children: <Widget>[

                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColors: LightColors.ZRed,
                                loadingPercents: 0.6,
                                titles: 'Possible match',
                                subtitles: 'Progress',

                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(width: 20.0),
                              RoundedButton(
                                text: "NEXT ",
                                press: () {onPressed();
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage();
                                    },


                                  ));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }

  Future<void> onPressed() async {
    var result = await FirebaseFirestore.instance
        .collection("Adopter")
        .where("PreferredAge", isGreaterThan:0)
        .get();
    result.docs.forEach((res) {
      print(res);
    });
  }
}

  class ImageBackground extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  ImageBackground({this.height, this.width, this.child, this.padding, BoxDecoration decoration, });


  @override
  Widget build(BuildContext context) {
  return Container(
  padding: padding!=null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
  decoration: BoxDecoration(
  color: LightColors.ZRed,
  borderRadius: BorderRadius.only(
  bottomRight: Radius.circular(40.0),
  bottomLeft: Radius.circular(40.0),
  )),
  height: height,
  width: width,
  child: child,
  );
  }
  void _onPressed() async {
    var result = await FirebaseFirestore.instance
        .collection("Adopter")
        .where("PreferredAge", isGreaterThan:0)
        .get();
    result.docs.forEach((res) {
      print(res);
    });
  }

  }


