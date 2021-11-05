import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';

class Ong {
  int? id;
  String? nome;
  String? usuario;
  String? email;
  String? cnpj;
  String? telefone;
  String? senha;
  Endereco? endereco;

  Ong.empty();

  Ong({
    this.id,
    required this.nome,
    required this.usuario,
    required this.email,
    required this.cnpj,
    required this.telefone,
    required this.senha,
    required this.endereco,
  });

  Ong copyWith(
      {int? id,
      String? nome,
      String? email,
      String? cnpj,
      String? telefone,
      String? senha,
      String? bairro,
      int? numero,
      String? complemento,
      int? cidade}) {
    return Ong(
        id: id,
        nome: nome ?? this.nome,
        usuario: usuario ?? this.usuario,
        email: email ?? this.email,
        cnpj: cnpj ?? this.cnpj,
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
    this.usuario = json['usuario'];
    this.email = json['email'];
    this.cnpj = json['cnpj'];
    this.telefone = json['telefone'];
    this.senha = json['senha'];
    this.endereco = json['endereco'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['usuario'] = this.usuario;
    data['email'] = this.email;
    data['cnpj'] = this.cnpj;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    return data;
  }
}
