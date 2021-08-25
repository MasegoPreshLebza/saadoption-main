import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/CheckBox.dart';
import 'package:saadoptionsystem/Main/pages/NewsFeed/news.dart';


class Terms extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: CheckBox(),
      ),

    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NewsFeedScreen();
                  },
                ),
              );
            }
        )
    );
  }
}
