import 'package:auresgate/app/data/models/localizacao_model.dart';

class Animal {
  int? id;
  String? estado;
  String? descricao;
  Localizacao? localizacao;
  String? imagem;

  Animal(
      {this.id,
      required this.estado,
      required this.descricao,
      required this.localizacao,
      required this.imagem});

  Animal copyWith(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude,
      String? imagem}) {
    return Animal(
        estado: estado ?? this.estado,
        descricao: descricao ?? this.descricao,
        imagem: imagem ?? this.imagem,
        localizacao: Localizacao(
            latitude: latitude ?? localizacao?.latitude,
            longitude: longitude ?? localizacao?.longitude));
  }

  Animal.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.estado = json['estado'];
    this.descricao = json['descricao'];
    this.imagem = json['imagem'];
    this.localizacao = Localizacao.fromJson(json['localizacao']);
  }

  Animal.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['estado'] = this.estado;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    data['localizacao'] = this.localizacao;

    return data;
  }
}
