part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final List<AreaEntity> recomendedItems;
  final List<AreaEntity> popluarItems;

  HomeSuccess(this.recomendedItems, this.popluarItems);
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final Exception exception;

  HomeError({required this.exception});
}
