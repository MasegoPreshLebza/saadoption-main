import 'package:flutter/material.dart';

import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';

import 'package:saadoptionsystem/Main/pages/GivingUpAChild/CheckBox2.dart';



class Terms extends StatelessWidget with NavigationStates {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
        child: CheckBox2(),
      ),

    );
  }


}
