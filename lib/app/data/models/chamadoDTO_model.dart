import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/localizacao_model.dart';
import 'package:auresgate/app/data/models/userDTO_model.dart';

class ChamadoDTO {
  late Animal animal;
  late UserDTO userDTO;

  ChamadoDTO({required this.animal, required userDTO});

  ChamadoDTO.fromJson(Map<String, dynamic> json) {
    this.animal = json['animal'];
    this.userDTO = json['userDTO'];
  }

  ChamadoDTO.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animal'] = this.animal;
    data['userDTO'] = this.userDTO;
    return data;
  }
}
