import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Splash/background.dart';

import '../../../../constants.dart';

class PsychometricTestBody extends StatelessWidget with NavigationStates {
  //justice
  //final String testId;

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
            child: Column(
          children: [
            Text(
              "PSYCHOMETRIC TEST",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF3F4768), width: 3),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) => Container(
                          width: constraints.maxHeight * 0.5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("18 sec"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
