import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/Resultspage/theme/colors/light_colors.dart';



class MyBackButton extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
        child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
          child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: LightColors.ZDarkBlue,
          ),
        ),
      ),
    );
  }
}