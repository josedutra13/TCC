import 'package:auresgate/app/data/models/localizacao_model.dart';

class Animal {
  int? id;
  String? estado;
  String? descricao;
  Localizacao? localizacao;
  String? img;

  Animal(
      {this.id,
      required this.estado,
      required this.descricao,
      required this.localizacao,
      required this.img});

  Animal copyWith(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude}) {
    return Animal(
        estado: estado ?? this.estado,
        descricao: descricao ?? this.descricao,
        img: img ?? this.img,
        localizacao: Localizacao(
            latitude: latitude ?? localizacao?.latitude,
            longitude: longitude ?? localizacao?.longitude));
  }

  Animal.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.estado = json['estado'];
    this.descricao = json['descricao'];
    this.img = json['img'];
    this.localizacao = Localizacao.fromJson(json['localizacao']);
  }

  Animal.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['estado'] = this.estado;
    data['descricao'] = this.descricao;
    data['img'] = this.img;
    data['localizacao'] = this.localizacao;

    return data;
  }
}
