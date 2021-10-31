import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class CityRepository extends ApiBase {
  CityRepository() : super('/cidades');

  Future<List<Cidade>> listCity(String id) async {
    var response = await client.get('/estado/$id');

    if (response.statusCode == 200 && response.data != null) {
      return (response.data as List)
          .map((json) => Cidade.fromJson(json))
          .toList();
    }
    return [];
  }
}