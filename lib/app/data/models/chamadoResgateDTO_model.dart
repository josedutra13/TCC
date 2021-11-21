import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/userDTO_model.dart';

class ChamadoResgateDTO {
  late int idChamado;
  late UserDTO loginDTO;

  ChamadoResgateDTO({required this.idChamado, required loginDTO});

  ChamadoResgateDTO.fromJson(Map<String, dynamic> json) {
    this.idChamado = json['idChamado'];
    this.loginDTO = json['loginDTO'];
  }

  ChamadoResgateDTO.empty();

  ChamadoResgateDTO copyWith(
      {int? idChamado, int? id, String? nome, bool? isPerson}) {
    return ChamadoResgateDTO(
        idChamado: idChamado ?? this.idChamado,
        loginDTO: UserDTO(
            id: id ?? loginDTO.id,
            nome: nome ?? loginDTO.nome,
            isPerson: isPerson ?? loginDTO.isPerson));
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idChamado'] = this.idChamado;
    data['loginDTO'] = this.loginDTO;
    return data;
  }
}
