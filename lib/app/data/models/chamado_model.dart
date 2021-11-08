import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/localizacao_model.dart';
import 'package:auresgate/app/data/models/pessoa_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';

class Chamado {
  int? id;
  DateTime? data_hora_abertura;
  DateTime? data_hora_fechamento;
  String? status;
  Animal? animal;
  Pessoa? usuario_abriu_chamado;
  User? usuario_atendeu_chamado;

  Chamado(
      {this.id,
      this.data_hora_abertura,
      this.data_hora_fechamento,
      this.status,
      this.animal,
      this.usuario_abriu_chamado,
      this.usuario_atendeu_chamado});

  Chamado.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.data_hora_abertura = DateTime.parse(json['data_hora_abertura']);
    this.data_hora_fechamento =
        DateTime.parse(json['data_hora_fechamento'] ?? '1999-09-29');
    this.status = json['status'];
    this.animal = Animal.fromJson(json['animal']);
    this.usuario_abriu_chamado = json['usuario_abriu_chamado'];
    this.usuario_atendeu_chamado =
        json['usuario_atendeu_chamado'] ?? User.empty();
  }

  Chamado.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data_hora_abertura'] = this.data_hora_abertura;
    data['data_hora_fechamento'] = this.data_hora_fechamento;
    data['status'] = this.status;
    data['animal'] = this.animal;
    data['usuario_abriu_chamado'] = this.usuario_abriu_chamado;
    data['usuario_atendeu_chamado'] = this.usuario_atendeu_chamado;

    return data;
  }
}
