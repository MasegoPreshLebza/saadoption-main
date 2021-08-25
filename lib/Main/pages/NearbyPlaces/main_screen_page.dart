import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saadoptionsystem/Main/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:saadoptionsystem/Main/pages/NearbyPlaces/application_bloc.dart';

import 'NearbyCentres.dart';

class MainScreenPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
    child: MaterialApp(
    home:NearbyCentresPage(),
      debugShowCheckedModeBanner: false,
    ),

    );
  }

}