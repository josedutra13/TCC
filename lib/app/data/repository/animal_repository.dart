import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class AnimalRepository extends ApiBase {
  AnimalRepository() : super('/animais');

  Future<Animal?> createAnimal(Animal animal) async {
    var response = await client.post('', data: animal.toJson());

    if (response.statusCode == 200 && response.data != null) {
      return Animal.fromJson(response.data);
    }

    return null;
  }

  Future<List<Animal>> listAnimal() async {
    var response = await client.get('');

    if (response.statusCode == 200 && response.data != null) {
      return (response.data as List)
          .map((json) => Animal.fromJson(json))
          .toList();
    }
    return [];
  }
}
