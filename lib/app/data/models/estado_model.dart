class Estado {
  int? id;
  late String nome;
  late String sigla;

  Estado({this.id, required this.nome, required this.sigla});

  Estado.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.sigla = json['sigla'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sigla'] = this.sigla;
    return data;
  }
}
