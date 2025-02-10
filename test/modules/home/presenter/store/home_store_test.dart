import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/categoria_itens_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';
import 'package:guiamoteisgo/modules/home/data/repositories/home_repository.dart';
import 'package:guiamoteisgo/modules/home/presenter/store/home_store.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeStore homeStore;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    homeStore = HomeStore(repository: mockHomeRepository);
  });

  group('HomeStore Tests', () {
    test('Deve conseguir ao pegar a lista de motéis', () async {
      final mockListMoteis = ListMoteis(moteis: [
        Moteis(
          fantasia: 'Motel 1',
          suites: [
            Suites(nome: 'Suite 1', categoriaItens: [
              CategoriaItens(nome: 'Ar Condicionado'),
              CategoriaItens(nome: 'TV'),
            ]),
          ],
        ),
      ]);
      when(() => mockHomeRepository.getListMoteis()).thenAnswer(
        (_) async => Right(mockListMoteis),
      );
      await homeStore.getListMoteis();
      expect(homeStore.listMoteis.length, 1);
      expect(homeStore.listMoteis[0].fantasia, 'Motel 1');
    });

    test('Deve falhar ao pegar a lista de motéis', () async {
      when(() => mockHomeRepository.getListMoteis())
          .thenAnswer((_) async => Left('Error'));
      await homeStore.getListMoteis();
      expect(homeStore.listMoteis.isEmpty, true);
    });

    test('Deve pegar as categorias', () {
      homeStore.listMoteis = [
        Moteis(
          fantasia: 'Motel 1',
          suites: [
            Suites(nome: 'Suite 1', categoriaItens: [
              CategoriaItens(nome: 'Ar Condicionado'),
              CategoriaItens(nome: 'TV'),
            ]),
          ],
        ),
        Moteis(
          fantasia: 'Motel 2',
          suites: [
            Suites(nome: 'Suite 2', categoriaItens: [
              CategoriaItens(nome: 'Ar Condicionado'),
              CategoriaItens(nome: 'Hidromassagem'),
            ]),
          ],
        ),
      ];
      final categories = homeStore.getCategories();
      expect(categories.length, 3);
      expect(categories.contains('Ar Condicionado'), true);
      expect(categories.contains('TV'), true);
      expect(categories.contains('Hidromassagem'), true);
    });

    test('Deve pegar as suites filtradas', () {
      final suites = [
        Suites(nome: 'Suite 1', categoriaItens: [
          CategoriaItens(nome: 'Ar Condicionado'),
        ]),
        Suites(nome: 'Suite 2', categoriaItens: [
          CategoriaItens(nome: 'TV'),
        ]),
        Suites(nome: 'Suite 3', categoriaItens: [
          CategoriaItens(nome: 'Ar Condicionado'),
          CategoriaItens(nome: 'TV'),
        ]),
      ];
      var filteredSuites =
          homeStore.getFilteredSuites(suites, ['ar condicionado']);
      expect(filteredSuites.length, 2);
      expect(filteredSuites[0].nome, 'Suite 1');
      expect(filteredSuites[1].nome, 'Suite 3');
      filteredSuites = homeStore.getFilteredSuites(suites, []);
      expect(filteredSuites.length, 3);
      filteredSuites = homeStore.getFilteredSuites(suites, ['tv']);
      expect(filteredSuites.length, 2);
      expect(filteredSuites[0].nome, 'Suite 2');
      expect(filteredSuites[1].nome, 'Suite 3');
    });

    test('Deve fazer um toggle na lista de filtro', () {
      homeStore.setFiltered('ar condicionado');
      expect(homeStore.listCategories.contains('ar condicionado'), true);
      homeStore.setFiltered('ar condicionado');
      expect(homeStore.listCategories.contains('ar condicionado'), false);
      homeStore.setFiltered('TV');
      expect(homeStore.listCategories.contains('tv'), true);
      homeStore.setFiltered('TV');
      expect(homeStore.listCategories.contains('tv'), false);
    });

    test('Deve alterar o estado de loading', () {
      homeStore.setLoading(true);
      expect(homeStore.loading, true);
      homeStore.setLoading(false);
      expect(homeStore.loading, false);
    });
  });
}
