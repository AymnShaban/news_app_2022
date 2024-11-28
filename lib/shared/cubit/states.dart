abstract class AppState {}

class AppInitialState extends AppState {}

class AppNavBarState extends AppState {}

class AppGetBusinessSuccessState extends AppState{}
class AppGetBusinessLoadingState extends AppState{}
class AppGetBusinessErrorState extends AppState{
  final String error;

  AppGetBusinessErrorState(this.error);
}

class AppGetSportsSuccessState extends AppState{}
class AppGetSportsLoadingState extends AppState{}
class AppGetSportsErrorState extends AppState{
  final String error;

  AppGetSportsErrorState(this.error);
}

class AppGetScienceSuccessState extends AppState{}
class AppGetScienceLoadingState extends AppState{}
class AppGetScienceErrorState extends AppState{
  final String error;

  AppGetScienceErrorState(this.error);
}

class AppChangeModeState extends AppState {}

class AppGetSearchSuccessState extends AppState{}
class AppGetSearchLoadingState extends AppState{}
class AppGetSearchErrorState extends AppState{
  final String error;
  AppGetSearchErrorState(this.error);
}
