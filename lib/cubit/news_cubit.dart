// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/Dio.dart';
import 'package:news/presentation/Bussines.dart';
import 'package:news/presentation/Science.dart';
import 'package:news/presentation/Sports.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  List screens = [
   const  BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: ' business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: ' Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: ' Science'),
  ];
 

  int currentIndex = 0;
  List<dynamic>? business = [];
  List<dynamic>? sports = [];
  List<dynamic>? science = [];

  void changeIndex(int index) {
    currentIndex = index;
    if (index == 1) getSportsData();
    if (index == 2) getScienceData();
    emit(BottomNavstate());
  }

  void getBusinessData() {
    emit(BussinesLoadingstate());
    if (business!.isEmpty) {
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': ''
      }).then((value) {
        business = value.data['articles'];
        emit(BussinesSuccessstate());
      }).catchError((error) {
        emit(BussinesErrorstate(error.toString()));
      });
    } else
      emit(BussinesSuccessstate());
  }

  void getSportsData() {
    emit(SportsLoadingstate());
    if (sports!.isEmpty) {
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': ''
      }).then((value) {
        sports = value.data['articles'];
        emit(SportsSuccessstate());
      }).catchError((error) {
        emit(SportsErrorstate(error.toString()));
      });
    } else
      emit(SportsSuccessstate());
  }

  void getScienceData() {
    emit(ScienceLoadingstate());
    if (science!.isEmpty) {
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': ''
      }).then((value) {
        science = value.data['articles'];
        emit(ScienceSuccessstate());
      }).catchError((error) {
        emit(ScienceErrorstate(error.toString()));
      });
    } else
      emit(ScienceSuccessstate());
  }
}
