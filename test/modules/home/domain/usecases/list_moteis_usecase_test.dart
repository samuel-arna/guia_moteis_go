import 'package:flutter_test/flutter_test.dart';
import 'package:guiamoteisgo/core/config/api_config.dart';
import 'package:guiamoteisgo/modules/home/data/datasources/remote_home_datasource.dart';
import 'package:guiamoteisgo/modules/home/data/repositories/home_repository.dart';
import 'package:guiamoteisgo/modules/home/domain/usecases/list_moteis_usecase.dart';

void main() {
  var datasource = RemoteHomeDatasource(ApiConfig.nPointAPI);
  // alterando para a api do jsonKeeper identifica o erro no certificado ssl

  var repository = HomeRepository(datasource);

  test('1. Deve pegar a lista de motéis', () async {
    var listMoteis = await ListMoteisUsecase(repository).getListMoteis();
    expect(listMoteis.isRight, true);
  });
}
