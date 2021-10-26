import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

class Pessoa {
  int? idade;
  String? sexo;
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? senha;
  Endereco? endereco;

  Pessoa.empty();

  Pessoa(
      {this.id,
      required this.nome,
      required this.email,
      required this.telefone,
      required this.senha,
      //TODO VERIFICAR ENDERAÇO VAZIO
      required this.endereco,
      required this.idade,
      required this.sexo});

  Pessoa copyWith(
      {int? idade,
      String? sexo,
      int? id,
      String? nome,
      String? email,
      String? telefone,
      String? senha,
      String? bairro,
      String? cep,
      int? numero,
      String? complemento,
      int? cidade}) {
    return Pessoa(
        id: id,
        idade: idade,
        sexo: sexo,
        nome: nome,
        email: email,
        telefone: telefone,
        senha: senha,
        endereco: Endereco(
            complemento: complemento,
            numero: numero,
            bairro: bairro,
            cep: cep,
            cidade: Cidade(
                id: cidade, nome: '', estado: Estado(nome: '', sigla: ''))));
  }

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.email = json['email'];
    this.telefone = json['telefone'];
    this.senha = json['senha'];
    this.endereco = json['endereco'];
    this.idade = json['idade'];
    this.sexo = json['sexo'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    return data;
  }
}
