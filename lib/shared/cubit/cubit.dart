import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappaymn/modules/business.dart';
import 'package:newsappaymn/modules/scince.dart';
import 'package:newsappaymn/modules/sports.dart';
import 'package:newsappaymn/network/remote/dio_helper.dart';
import 'package:newsappaymn/shared/cubit/states.dart';
import '../../network/local/cashe_helper.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit(): super(AppInitialState());
static AppCubit get(context)=> BlocProvider.of(context);

int currentIndex= 0;
// ignore: non_constant_identifier_names
void ChangeBottomNavBAr(int index)
  {
     currentIndex= index;
      if(index==1) {
       getSports();}
     else if(index==2) {
       getScience();}
    emit(AppNavBarState());
  }
List<Widget> screens =[
  const BusinessScreen(),
  const SportsScreen(),
  const ScienceScreen(),
  ];

// ignore: non_constant_identifier_names
List<BottomNavigationBarItem> BottomItems = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.business),
    label: 'Business',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.sports_kabaddi),
    label: 'Sports',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.science),
    label: 'Science',
  ),
];
List<dynamic> business = [];
List<dynamic> sports = [];
List<dynamic> science = [];
// ignore: non_constant_identifier_names
void getBusiness() {
  emit(AppGetBusinessLoadingState());
  if(business.isEmpty){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apikey': 'd3fa4bb5c3144211959ebad1982d53ed',
        })
        .then((value) { print(value?.data.toString());
    business= value?.data['articles'];
    emit(AppGetBusinessSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(AppGetBusinessErrorState(error.toString()));
    });
  }
  else {emit(AppGetBusinessSuccessState());}


}
void getSports() {
  emit(AppGetSportsLoadingState());
  if(sports.isEmpty){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apikey': 'd3fa4bb5c3144211959ebad1982d53ed',
        })
        .then((value) { print(value?.data.toString());
    sports= value?.data['articles'];
    emit(AppGetSportsSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(AppGetSportsErrorState(error.toString()));
    });
  }else {emit(AppGetSportsSuccessState());}

}
void getScience() {
  emit(AppGetScienceLoadingState());
  if(science.isEmpty){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apikey': 'd3fa4bb5c3144211959ebad1982d53ed',
        })
        .then((value) { print(value?.data.toString());
    science= value?.data['articles'];
    emit(AppGetScienceSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(AppGetScienceErrorState(error.toString()));
    });
  }else {emit(AppGetScienceSuccessState());}


}
  bool isDark = false;
void changeAppMode(){
  isDark = !isDark;
  CasheHelper.putData(key: 'isDark', value: isDark).then((value) {
    emit(AppChangeModeState());

  });
}
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(AppGetSearchLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query: {

          'q': value,
          'apikey': 'd3fa4bb5c3144211959ebad1982d53ed',
        })
        .then((value) {
    search= value?.data['articles'];
    print(search[0]['title']);
    emit(AppGetSearchSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(AppGetSearchErrorState(error.toString()));
    });

  }
}