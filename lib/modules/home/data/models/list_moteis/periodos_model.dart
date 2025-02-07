import 'package:guiamoteisgo/modules/home/data/models/list_moteis/desconto_model.dart';

class Periodos {
  String? tempoFormatado;
  String? tempo;
  double? valor;
  double? valorTotal;
  bool? temCortesia;
  Desconto? desconto;

  Periodos(
      {this.tempoFormatado,
      this.tempo,
      this.valor,
      this.valorTotal,
      this.temCortesia,
      this.desconto});

  Periodos.fromJson(Map<String, dynamic> json) {
    tempoFormatado = json['tempoFormatado'];
    tempo = json['tempo'];
    valor = json['valor'];
    valorTotal = json['valorTotal'];
    temCortesia = json['temCortesia'];
    desconto =
        json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tempoFormatado'] = tempoFormatado;
    data['tempo'] = tempo;
    data['valor'] = valor;
    data['valorTotal'] = valorTotal;
    data['temCortesia'] = temCortesia;
    if (desconto != null) {
      data['desconto'] = desconto!.toJson();
    }
    return data;
  }
}
