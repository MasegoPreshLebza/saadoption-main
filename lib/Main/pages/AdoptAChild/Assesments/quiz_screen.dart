
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/Assesments/question_controller.dart';

import 'BodyClass.dart';
import 'body.dart';


class QuizScreenBody extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
    body: BodyQuiz(),
    );
  }
}