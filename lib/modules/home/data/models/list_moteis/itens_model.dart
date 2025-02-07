class Itens {
  String? nome;

  Itens({this.nome});

  Itens.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    return data;
  }
}
