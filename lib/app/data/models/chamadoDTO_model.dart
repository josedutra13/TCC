import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/userDTO_model.dart';

class ChamadoDTO {
  late Animal animal;
  late UserDTO loginDTO;

  ChamadoDTO({required this.animal, required loginDTO});

  ChamadoDTO.fromJson(Map<String, dynamic> json) {
    this.animal = json['animal'];
    this.loginDTO = json['loginDTO'];
  }

  ChamadoDTO.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animal'] = this.animal;
    data['loginDTO'] = this.loginDTO;
    return data;
  }
}
