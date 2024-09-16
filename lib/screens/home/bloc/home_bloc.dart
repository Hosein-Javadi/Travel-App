import 'package:aspen_explore_application/data/repository/main_repository.dart';
import 'package:aspen_explore_application/objects/Area.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      try {
        emit(HomeLoading());
        if (event is HomeStarted || event is HomeLoading) {
          final recdata = await repository.getAll(AreaSort.recomendedSort);
          final popdata = await repository.getAll(AreaSort.defaultSort);
          emit(HomeSuccess(recdata, popdata));
        }
      } catch (e) {
        if (e is DioException) {
          emit(
            HomeError(
              exception: e.response?.data['message'],
            ),
          );
        } else {
          emit(HomeError(exception: Exception('Unknown Error')));
        }
      }
    });
  }
}
