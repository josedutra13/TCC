import 'package:auresgate/app/data/models/estado_model.dart';

class Cidade {
  int? id;
  late String nome;
  late Estado estado;

  Cidade({this.id, required this.nome, required this.estado});

  Cidade.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.estado = Estado.fromJson(json['estado']);
  }

  Cidade.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['estado'] = this.estado;
    return data;
  }
}
