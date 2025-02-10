// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

// cd test && flutter test tester.dart
void main() {
  test('Deve executar testes em paralelo', () async {
    final testFiles = [
      'test/modules/home/presenter/store/home_store_test.dart',
      'test/modules/home/domain/usecases/list_moteis_usecase_test.dart',
      'test/modules/home/presenter/widgets/motel/list_suites/list_periodos_test.dart',
    ];
    final processes = <Future<Process>>[];
    for (final file in testFiles) {
      print(file);
      processes.add(Process.start('flutter', ['test', file]));
    }
    for (final futureProcess in processes) {
      final process = await futureProcess;
      final exitCode = await process.exitCode;
      if (exitCode != 0) {
        final stdout =
            await process.stdout.transform(const Utf8Decoder()).join();
        final stderr =
            await process.stderr.transform(const Utf8Decoder()).join();
        print('Stdout: $stdout');
        print('Stderr: $stderr');
      }
      expect(exitCode, 0, reason: 'Testes falharam');
    }
  }, timeout: const Timeout(Duration(minutes: 10)));
  // Timeout aumentado para evitar travamentos
}
