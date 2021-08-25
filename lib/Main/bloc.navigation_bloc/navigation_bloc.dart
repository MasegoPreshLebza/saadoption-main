import 'package:bloc/bloc.dart';
import 'package:saadoptionsystem/Main/pages/AbondonedChild/ReportAbondonedChild.dart';
import 'package:saadoptionsystem/Main/pages/AdoptAChild/TermsAndConditions.dart';
import 'package:saadoptionsystem/Main/pages/GivingUpAChild/GiveUpAChild.dart';
import 'package:saadoptionsystem/Main/pages/MissingChild/ReportMissingChild.dart';
import 'package:saadoptionsystem/Main/pages/NearbyPlaces/main_screen_page.dart';
import 'package:saadoptionsystem/Main/pages/NewsFeed/news.dart';
import 'package:saadoptionsystem/Main/pages/Profile/main.dart';


enum NavigationEvents {
  AdoptChildClickedEvent,
  GiveUpChildClickedEvent,
  ReportChildClickedEvent,
  AbondonedChildClickedEvent,
  NearbyCentresChildClickedEvent,
  ProfileChildClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => NewsFeedScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.AdoptChildClickedEvent:
        yield Terms();
        break;
      case NavigationEvents.GiveUpChildClickedEvent:
        yield GiveUpPage();
        break;
      case NavigationEvents.ReportChildClickedEvent:
        yield ReportChildPage();
        break;
      case NavigationEvents.AbondonedChildClickedEvent:
        yield AbondonedChildPage();
        break;
      case NavigationEvents.NearbyCentresChildClickedEvent:
        yield MainScreenPage();
        break;
      case NavigationEvents.ProfileChildClickedEvent:
        yield UserProfile();
        break;
    }
  }
}
