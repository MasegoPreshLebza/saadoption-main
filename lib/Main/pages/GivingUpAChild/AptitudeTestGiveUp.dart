import 'package:flutter/material.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';

import 'AptitudeTestBodyGiveUp.dart';


class AptitudeTestGiveUp extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AptitudeTestBodyGiveUp(),
      ),
    );
  }
}
