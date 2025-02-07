import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:guiamoteisgo/core/config/api_config.dart';
import 'package:guiamoteisgo/modules/home/data/datasources/remote_home_datasource.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/repositories/home_repository.dart';
import 'package:guiamoteisgo/modules/home/domain/usecases/list_moteis_usecase.dart';

var datasource = RemoteHomeDatasource(ApiConfig.nPointAPI);
var repository = HomeRepository(datasource);

class HomeStore extends ChangeNotifier {
  List<Moteis> listMoteis = [];
  bool loading = false;

  Future<void> getListMoteis() async {
    setLoading(true);
    Either<String, ListMoteis> response =
        await ListMoteisUsecase(repository).getListMoteis();
    response.isRight
        ? listMoteis = response.right.moteis ?? []
        : print(response.left);
    setLoading(false);
  }

  void setLoading(bool v) {
    loading = v;
    notifyListeners();
  }
}
