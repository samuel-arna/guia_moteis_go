import 'package:flutter_test/flutter_test.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/categoria_itens_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/store/home_store.dart';

void main() {
  test('Deve pegar a lista de suítes filtradas', () async {
    List<String> filtro = ['amarelo', 'azul'];
    List<Suites> nList = [];
    nList.add(
      Suites(
        categoriaItens: [CategoriaItens(nome: 'azul')],
      ),
    );
    nList.add(
      Suites(
        categoriaItens: [CategoriaItens(nome: 'amarelo')],
      ),
    );
    nList.add(
      Suites(categoriaItens: [
        CategoriaItens(nome: 'amarelo'),
        CategoriaItens(nome: 'vermelho'),
      ]),
    );

    expect(HomeStore().getFilteredSuites(nList, filtro).length, 3);
    filtro.remove('amarelo');
    expect(HomeStore().getFilteredSuites(nList, filtro).length, 1);
  });
}
