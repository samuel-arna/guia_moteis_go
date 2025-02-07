class CategoriaItens {
  String? nome;
  String? icone;

  CategoriaItens({this.nome, this.icone});

  CategoriaItens.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    icone = json['icone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['icone'] = icone;
    return data;
  }
}
