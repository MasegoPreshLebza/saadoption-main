import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'AdoptChild.dart';

class AdoptersScreen extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ADOPT A CHILD"),
          centerTitle: true,

        ),
      body: SingleChildScrollView(
        child: AdopterPage(),
      ),
    );
  }
}
