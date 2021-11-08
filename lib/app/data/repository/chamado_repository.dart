import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/chamadoDTO_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class ChamadoRepository extends ApiBase {
  ChamadoRepository() : super('/chamados');

  Future<Chamado?> createChamado(ChamadoDTO chamado) async {
    var response = await client.post('', data: chamado.toJson());

    if (response.statusCode == 200 && response.data != null) {
      return Chamado.fromJson(response.data);
    }

    return null;
  }

  Future<List<Chamado>> listChamado() async {
    var response = await client.get('');

    if (response.statusCode == 200 && response.data != null) {
      return (response.data as List)
          .map((json) => Chamado.fromJson(json))
          .toList(); 
    }
    return [];
  }
}
