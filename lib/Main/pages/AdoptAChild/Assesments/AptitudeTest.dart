import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/AptitudeTestBody.dart';

class AptitudeTest extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aptitude Test"),
          centerTitle: true,

        ),
      body: SingleChildScrollView(
        child: AptitudeTestBody(),
      ),
    );
  }
}
