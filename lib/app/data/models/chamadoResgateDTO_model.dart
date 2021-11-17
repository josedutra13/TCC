import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/userDTO_model.dart';

class ChamadoResgateDTO {
  late int? id;
  late UserDTO loginDTO;

  ChamadoResgateDTO({this.id, required loginDTO});

  ChamadoResgateDTO.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.loginDTO = json['loginDTO'];
  }

  ChamadoResgateDTO.empty();

  ChamadoResgateDTO copyWith({
    
    String? nome, bool? isPerson}) {
    return ChamadoResgateDTO(
        loginDTO: UserDTO(
            id: id ?? loginDTO.id,
            nome: nome ?? loginDTO.nome,
            isPerson: isPerson ?? loginDTO.isPerson));
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loginDTO'] = this.loginDTO;
    return data;
  }
}
