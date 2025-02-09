import 'dart:convert';
import 'package:either_dart/either.dart';

import 'package:http/http.dart' as http;
// utilizaria o pacote dio ao invés de http, para montar as exceptions através de interceptors.

import 'package:guiamoteisgo/modules/home/data/models/list_moteis_model.dart';

class RemoteHomeDatasource {
  final String urlBase;
  RemoteHomeDatasource(this.urlBase);

  Future<Either<String, ListMoteis>> getListMoteis() async {
    try {
      var response = await http.get(
        Uri.parse(urlBase),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse.containsKey('data')) {
            return Right(ListMoteis.fromJson(jsonResponse['data']));
          } else {
            return Left('Resposta JSON inválida: não contém a chave "data"');
          }
        } catch (e) {
          return Left('Erro ao decodificar JSON: $e');
        }
      } else {
        return Left(
            'Erro na requisição: HTTP status code: ${response.statusCode}, Body: ${response.body}');
      }
    } catch (e) {
      return Left('Erro na requisição: $e');
    }
  }
}
