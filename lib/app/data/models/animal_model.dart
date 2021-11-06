import 'package:auresgate/app/data/models/localizacao_model.dart';

class Animal {
  int? id;
  late String estado;
  late String descricao;
  late Localizacao localizacao;

  Animal(
      {this.id,
      required this.estado,
      required this.descricao,
      required this.localizacao});

  Animal copyWith(
      {String? estado,
      String? descricao,
      double? latitude,
      double? longitude}) {
    return Animal(
        estado: estado ?? this.estado,
        descricao: descricao ?? this.descricao,
        localizacao: Localizacao(
            latitude: latitude ?? localizacao.latitude,
            longitude: longitude ?? localizacao.longitude));
  }

  Animal.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.estado = json['estado'];
    this.descricao = json['descricao'];
    this.localizacao = json['localizacao'];
  }

  Animal.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['estado'] = this.estado;
    data['descricao'] = this.descricao;
    data['localizacao'] = this.localizacao;
    return data;
  }
}
