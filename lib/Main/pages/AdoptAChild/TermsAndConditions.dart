import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/CheckBox.dart';
import 'package:saadoptionsystem/Main/pages/NewsFeed/news.dart';


class Terms extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: CheckBox(),
      ),

    );
  }


}
