import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:guiamoteisgo/core/config/api_config.dart';
import 'package:guiamoteisgo/modules/home/data/datasources/remote_home_datasource.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/repositories/home_repository.dart';
import 'package:guiamoteisgo/modules/home/domain/usecases/list_moteis_usecase.dart';

var datasource = RemoteHomeDatasource(ApiConfig.nPointAPI);
var repository = HomeRepository(datasource);

class HomeStore extends ChangeNotifier {
  List<String> listCategories = [];
  List<Moteis> listMoteis = [];
  bool loading = false;

  Future<void> getListMoteis() async {
    setLoading(true);
    Either<String, ListMoteis> response =
        await ListMoteisUsecase(repository).getListMoteis();
    response.isRight
        ? listMoteis = response.right.moteis ?? []
        : print(response.left);
    notifyListeners();
    Future.delayed(Duration(seconds: 3), () {
      setLoading(false);
    });
  }

  Set<String> getCategories() {
    Set<String> categories = {};
    for (var motel in listMoteis) {
      if (motel.suites != null) {
        for (var suite in motel.suites!) {
          if (suite.categoriaItens != null) {
            for (var item in suite.categoriaItens!) {
              if (item.nome != null) {
                categories.add(item.nome!);
              }
            }
          }
        }
      }
    }
    return categories;
  }

  List<Suites> getFilteredSuites(List<Suites> suites, List<String> filter) {
    if (filter.isEmpty) {
      return suites;
    }
    final Set<String> categorySet = filter.toSet();
    List<Suites> filteredSuites = [];
    for (final suite in suites) {
      if (suite.categoriaItens != null) {
        if (suite.categoriaItens!.any((item) =>
            item.nome != null &&
            categorySet.contains(item.nome!.toLowerCase()))) {
          filteredSuites.add(suite);
        }
      }
    }
    return filteredSuites;
  }

  setFiltered(String category) {
    String catLC = category.toLowerCase();
    if (listCategories.contains(catLC)) {
      listCategories.remove(catLC);
    } else {
      listCategories.add(catLC);
    }
    notifyListeners();
  }

  void setLoading(bool v) {
    loading = v;
    notifyListeners();
  }
}
