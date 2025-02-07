import 'package:either_dart/either.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/repositories/home_repository.dart';

class ListMoteisUsecase {
  final HomeRepository repository;
  ListMoteisUsecase(this.repository);

  Future<Either<String, ListMoteis>> getListMoteis() async {
    return repository.getListMoteis();
  }
}
