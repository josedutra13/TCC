import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class StatesRepository extends ApiBase {
  StatesRepository() : super('/estados');

  Future<List<Estado>> listStates() async {
    var response = await client.get('');

    if (response.statusCode == 200 && response.data != null) {
      return (response.data as List)
          .map((json) => Estado.fromJson(json))
          .toList();
    }
    return [];
  }
}
