import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/desconto_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/periodos_model.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/list_periodos.dart';
import 'package:guiamoteisgo/modules/home/presenter/widgets/motel/list_suites/periodo_item.dart';

void main() {
  group('ListPeriodos Widget Test', () {
    testWidgets('Renderiza corretamente com dados',
        (WidgetTester tester) async {
      // mock
      final periodos = [
        Periodos(
          tempoFormatado: '2 Horas',
          desconto: Desconto(desconto: 20),
          valor: 100.0,
          valorTotal: 80.0,
        ),
        Periodos(
          tempoFormatado: '4 Horas',
          valorTotal: 150.0,
        ),
      ];

      // Constroi o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body: Column(
            children: [
              ListPeriodos(periodos: periodos),
            ],
          )),
        ),
      );

      // Verifica os widgets
      expect(find.text('2 Horas'), findsOneWidget);
      expect(find.text('20% off'), findsOneWidget);
      expect(find.text('R\$ 100,00'), findsOneWidget);
      expect(find.text('R\$ 80,00'), findsOneWidget);
      expect(find.text('4 Horas'), findsOneWidget);
      expect(find.text('R\$ 150,00'), findsOneWidget);

      // Verificar o número correto de itens
      expect(find.byType(PeriodoItem), findsNWidgets(periodos.length));
    });

    testWidgets('Deve renderizar corretamente com dados vazios',
        (WidgetTester tester) async {
      final periodos = <Periodos>[];
      await tester.pumpWidget(
        MaterialApp(
          home: ListPeriodos(periodos: periodos),
        ),
      );
      // Verificar se nada é renderizado quando a lista está vazia
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('Deve calcular o valor de desconto',
        (WidgetTester tester) async {
      final periodos = [
        Periodos(
          tempoFormatado: '2 Horas',
          desconto: Desconto(desconto: 25),
          valor: 100.0,
          valorTotal: 75.0,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: ListPeriodos(periodos: periodos),
        ),
      );
      expect(find.text('25% off'), findsOneWidget);
    });
  });
}
