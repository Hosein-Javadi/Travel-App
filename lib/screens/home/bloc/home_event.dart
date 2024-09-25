part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeStarted extends HomeEvent {
  final bool isEnglish;

  HomeStarted({required this.isEnglish});
}

class HomeRefresh extends HomeEvent {
  final bool isEnglish;

  HomeRefresh({required this.isEnglish});
}
