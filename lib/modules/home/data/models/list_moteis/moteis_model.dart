import 'package:guiamoteisgo/modules/home/data/models/list_moteis/suites_model.dart';

class Moteis {
  String? fantasia;
  String? logo;
  String? bairro;
  double? distancia;
  int? qtdFavoritos;
  List<Suites>? suites;
  int? qtdAvaliacoes;
  double? media;

  Moteis(
      {this.fantasia,
      this.logo,
      this.bairro,
      this.distancia,
      this.qtdFavoritos,
      this.suites,
      this.qtdAvaliacoes,
      this.media});

  Moteis.fromJson(Map<String, dynamic> json) {
    fantasia = json['fantasia'];
    logo = json['logo'];
    bairro = json['bairro'];
    distancia = json['distancia'];
    qtdFavoritos = json['qtdFavoritos'];
    if (json['suites'] != null) {
      suites = <Suites>[];
      json['suites'].forEach((v) {
        suites!.add(Suites.fromJson(v));
      });
    }
    qtdAvaliacoes = json['qtdAvaliacoes'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fantasia'] = fantasia;
    data['logo'] = logo;
    data['bairro'] = bairro;
    data['distancia'] = distancia;
    data['qtdFavoritos'] = qtdFavoritos;
    if (suites != null) {
      data['suites'] = suites!.map((v) => v.toJson()).toList();
    }
    data['qtdAvaliacoes'] = qtdAvaliacoes;
    data['media'] = media;
    return data;
  }
}
