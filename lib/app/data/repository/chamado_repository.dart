import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/chamadoDTO_model.dart';
import 'package:auresgate/app/data/models/chamadoResgateDTO_model.dart';
import 'package:auresgate/app/data/models/chamado_model.dart';
import 'package:auresgate/app/data/providers/api.dart';
import 'package:dio/dio.dart';

class ChamadoRepository extends ApiBase {
  ChamadoRepository() : super('/chamados');

  Future<Chamado?> createChamado(ChamadoDTO chamadoDTO) async {
    print('TESTEI AQUI ${chamadoDTO.img}');
    var response = await client.post('', data: chamadoDTO.toJson());

    if (response.statusCode == 200 && response.data != null) {
      return Chamado.fromJson(response.data);
    }

    return null;
  }

  Future<void> updateChamado(Animal animal, int id) async {
    await client.put('/$id', data: animal.toJson());
  }

  Future<void> associateChamado(ChamadoResgateDTO chamadoResgateDTO) async {
    await client.put('', data: chamadoResgateDTO.toJson());
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

  Future<bool> deleteChamado(int id) async {
    var response = await client.delete('/$id');

    if (response.statusCode == 204 || response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
