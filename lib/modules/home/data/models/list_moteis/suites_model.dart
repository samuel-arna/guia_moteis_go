import 'package:guiamoteisgo/modules/home/data/models/list_moteis/categoria_itens_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/itens_model.dart';
import 'package:guiamoteisgo/modules/home/data/models/list_moteis/periodos_model.dart';

class Suites {
  String? nome;
  int? qtd;
  bool? exibirQtdDisponiveis;
  List<String>? fotos;
  List<Itens>? itens;
  List<CategoriaItens>? categoriaItens;
  List<Periodos>? periodos;

  Suites(
      {this.nome,
      this.qtd,
      this.exibirQtdDisponiveis,
      this.fotos,
      this.itens,
      this.categoriaItens,
      this.periodos});

  Suites.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    qtd = json['qtd'];
    exibirQtdDisponiveis = json['exibirQtdDisponiveis'];
    fotos = json['fotos'].cast<String>();
    if (json['itens'] != null) {
      itens = <Itens>[];
      json['itens'].forEach((v) {
        itens!.add(Itens.fromJson(v));
      });
    }
    if (json['categoriaItens'] != null) {
      categoriaItens = <CategoriaItens>[];
      json['categoriaItens'].forEach((v) {
        categoriaItens!.add(CategoriaItens.fromJson(v));
      });
    }
    if (json['periodos'] != null) {
      periodos = <Periodos>[];
      json['periodos'].forEach((v) {
        periodos!.add(Periodos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['qtd'] = qtd;
    data['exibirQtdDisponiveis'] = exibirQtdDisponiveis;
    data['fotos'] = fotos;
    if (itens != null) {
      data['itens'] = itens!.map((v) => v.toJson()).toList();
    }
    if (categoriaItens != null) {
      data['categoriaItens'] = categoriaItens!.map((v) => v.toJson()).toList();
    }
    if (periodos != null) {
      data['periodos'] = periodos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
