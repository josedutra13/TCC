import 'package:auresgate/app/data/models/estado_model.dart';

class Localizacao {
  int? id;
  late double latitude;
  late double longitude;

  Localizacao({this.id, required this.latitude, required this.longitude});

  Localizacao.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
  }

  Localizacao.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
