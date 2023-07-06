// ignore_for_file: prefer_typing_uninitialized_variables

part of 'news_cubit.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class BottomNavstate extends NewsState {}

class BussinesLoadingstate extends NewsState {}

class BussinesSuccessstate extends NewsState {}

class BussinesErrorstate extends NewsState {
  final error;
  BussinesErrorstate(this.error);
}
class SportsLoadingstate extends NewsState {}

class SportsSuccessstate extends NewsState {}

class SportsErrorstate extends NewsState {
  final error;
 SportsErrorstate(this.error);
}
class ScienceLoadingstate extends NewsState {}

class ScienceSuccessstate extends NewsState {}

class ScienceErrorstate extends NewsState {
  final error;
  ScienceErrorstate(this.error);
}
class ChangeThemestate extends NewsState {}
