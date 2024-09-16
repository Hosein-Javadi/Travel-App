import 'package:aspen_explore_application/data/sources/local_database.dart';
import 'package:aspen_explore_application/data/sources/main_source.dart';
import 'package:aspen_explore_application/objects/Area.dart';
import 'package:dio/dio.dart';

class RemoteDataSource implements AppSources {
  final Dio dio;

  RemoteDataSource({required this.dio});
  @override
  Future<List<AreaEntity>> getAll(AreaSort sortType) async {
    final localDatas = LocalAppDataBase();
    String urL = sortType == AreaSort.defaultSort
        ? '/data/Tourist%20Areas?sortBy=%60priority%60%20desc'
        : 'data/Tourist%20Areas?sortBy=%60likes%60%20desc';
    final Response = await dio.get(urL);
    if (Response.statusCode == 200) {
      final List<AreaEntity> items = [];
      (Response.data as List).forEach(
        (element) => items.add(AreaEntity.fromJson(element)),
      );
      return items;
    } else {
      return localDatas.getAll(sortType);
    }
  }
}
