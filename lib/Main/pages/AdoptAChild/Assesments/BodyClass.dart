
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';

import 'body.dart';

class BodyQuizScreen extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BodyQuiz(),
      ),
    );
  }
}
