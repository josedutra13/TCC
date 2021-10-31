import 'package:auresgate/app/data/models/cidade_model.dart';

class Endereco {
  int? id;
  String? complemento;
  int? numero;
  String? bairro;
  Cidade? cidade;

  Endereco(
      {this.id,
      required this.complemento,
      required this.numero,
      required this.bairro,
      required this.cidade});

  Endereco.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.complemento = json['complemento'];
    this.numero = json['numero'];
    this.bairro = json['bairro'];
    this.cidade = json['cidade'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['complemento'] = this.complemento;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    return data;
  }
}
