import 'package:aspen_explore_application/objects/Area.dart';

abstract class AppSources {
  Future<List<AreaEntity>> getAll(AreaSort sortType);
}


