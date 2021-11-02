import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

class Ong {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? senha;
  Endereco? endereco;

  Ong.empty();

  Ong({
    this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
    required this.endereco,
  });

  Ong copyWith(
      {int? id,
      String? nome,
      String? email,
      String? telefone,
      String? senha,
      String? bairro,
      String? cep,
      int? numero,
      String? complemento,
      int? cidade}) {
    return Ong(
        id: id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        senha: senha ?? this.senha,
        endereco: Endereco(
            complemento: complemento ?? this.endereco?.complemento,
            numero: numero ?? this.endereco?.numero,
            bairro: bairro ?? this.endereco?.bairro,
            cidade: Cidade(
                id: cidade ?? this.endereco?.cidade?.id,
                nome: '',
                estado: Estado(nome: '', sigla: ''))));
  }

  fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.nome = json['nome'];
    this.email = json['email'];
    this.telefone = json['telefone'];
    this.senha = json['senha'];
    this.endereco = json['endereco'];
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
