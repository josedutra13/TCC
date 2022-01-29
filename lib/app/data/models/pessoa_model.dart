import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';

class Pessoa extends User {
  int? idade;
  String? sexo;

  Pessoa.empty() : super.empty();

  Pessoa(
      {final int? id,
      final String? nome,
      final String? nomeUsuario,
      final String? email,
      final String? telefone,
      final String? senha,
      //TODO VERIFICAR ENDERAÇO VAZIO
      final Endereco? endereco,
      required this.idade,
      required this.sexo})
      : super(
            email: email,
            senha: senha,
            endereco: endereco,
            nome: nome,
            nomeUsuario: nomeUsuario,
            telefone: telefone);

  Pessoa copyWith(
      {int? idade,
      String? sexo,
      int? id,
      String? nome,
      String? nomeUsuario,
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
        idade: idade ?? this.idade,
        sexo: sexo ?? this.sexo,
        nome: nome ?? this.nome,
        nomeUsuario: nomeUsuario ?? this.nomeUsuario,
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
    this.nomeUsuario = json['nomeUsuario'];
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
    data['nomeUsuario'] = this.nomeUsuario;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['senha'] = this.senha;
    data['endereco'] = this.endereco;
    data['sexo'] = this.sexo;
    data['idade'] = this.idade;
    return data;
  }
}
