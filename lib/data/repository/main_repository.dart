import 'package:aspen_explore_application/data/sources/main_source.dart';
import 'package:aspen_explore_application/objects/Area.dart';

abstract class MainAppRepository {
  Future<List<AreaEntity>> getAll(AreaSort sortType);
}

class AppRepository implements MainAppRepository {
  final AppSources source;

  AppRepository({required this.source});
  @override
  Future<List<AreaEntity>> getAll(AreaSort sortType) async {
    return await source.getAll(sortType);
  }
}
