import 'package:aspen_explore_application/data/common/common.dart';
import 'package:aspen_explore_application/data/repository/main_repository.dart';
import 'package:aspen_explore_application/data/sources/remote_source.dart';
import 'package:aspen_explore_application/screens/home/bloc/home_bloc.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // Get.snackbar('Text Title', 'Test Message');
    super.onInit();
  }

  final bloc = HomeBloc(
      AppRepository(source: RemoteDataSource(dio: CommonDataBase.appDio)));

  dynamic args = Get.arguments;

  void addEvent(HomeEvent event) {
    bloc.add(event);
  }
}
