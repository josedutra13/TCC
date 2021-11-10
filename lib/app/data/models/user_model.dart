import 'package:auresgate/app/data/models/endereco_model.dart';

class User {
  int? id;
  String? nomeUsuario;
  String? nome;
  String? email;
  String? senha;
  String? telefone;
  Endereco? endereco;
  User(
      {this.id,
      required this.nome,
      required this.nomeUsuario,
      required this.email,
      required this.telefone,
      required this.senha,
      required this.endereco});

  User.empty();

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nomeUsuario = json['nomeUsuario'];
    this.nome = json['nome'];
    this.email = json['email'];
    this.telefone = json['telefone'];
    this.senha = json['senha'];
    this.endereco = Endereco.fromJson(json['endereco']);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['nomeUsuario'] = this.nomeUsuario;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    return data;
  }
}
