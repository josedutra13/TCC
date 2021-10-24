import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';

class Pessoa {
  late int idade;
  late String sexo;
  int? id;
  late String nome;
  late String email;
  late String telefone;
  late String senha;
  late Endereco? endereco;

  Pessoa({
    int? id,
    String nome = '',
    String email = '',
    String telefone = '',
    String senha = '',
    //TODO VERIFICAR ENDERAÇO VAZIO
    Endereco? endereco,
    required this.idade,
    required this.sexo, required String bairro,
  });

  Pessoa.empty();
  Pessoa copyWith({
    int? idade,
    String? sexo,
    int? id,
    String? nome,
    String? email,
    String? telefone,
    String? senha,
    String? bairro
  }) {
    return Pessoa(
        id: id,
        idade: idade ?? this.idade,
        sexo: sexo ?? this.sexo,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        telefone: telefone ?? this.telefone,
        senha: senha ?? this.senha,
        bairro: endereco!.bairro
  }

  Pessoa.fromJson(Map<String, dynamic> json) {
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
