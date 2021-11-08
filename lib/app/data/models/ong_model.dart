import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';

class Ong extends User {
  int? id;
  String? cnpj;

  Ong.empty() : super.empty();

  Ong({
    this.id,
    final String? nome,
    final String? nomeUsuario,
    final String? email,
    required this.cnpj,
    final String? telefone,
    final String? senha,
    final Endereco? endereco,
  }) : super(
            email: email,
            senha: senha,
            endereco: endereco,
            nome: nome,
            nomeUsuario: nomeUsuario,
            telefone: telefone);

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
        nomeUsuario: nomeUsuario ?? this.nomeUsuario,
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
    this.nomeUsuario = json['nomeUsuario'];
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
    data['nomeUsuario'] = this.nomeUsuario;
    data['email'] = this.email;
    data['cnpj'] = this.cnpj;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    return data;
  }
}
