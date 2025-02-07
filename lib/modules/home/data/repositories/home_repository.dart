import 'package:either_dart/either.dart';
import 'package:guiamoteisgo/modules/home/data/datasources/remote_home_datasource.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';

class HomeRepository implements _HomeRepository {
  RemoteHomeDatasource datasource;
  HomeRepository(this.datasource);

  @override
  Future<Either<String, ListMoteis>> getListMoteis() async {
    return await datasource.getListMoteis();
  }
}

abstract class _HomeRepository {
  Future<Either<String, ListMoteis>> getListMoteis();
}
