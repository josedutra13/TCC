import 'package:auresgate/app/data/models/pessoa_model.dart';
import 'package:auresgate/app/data/models/user_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class PersonsRepository extends ApiBase {
  PersonsRepository() : super('/pessoas');
  Future<Pessoa?> createUserPerson(Pessoa pessoa) async {
    var response = await client.post('', data: pessoa);

    if (response.statusCode == 200 && response.data != null) {
      return Pessoa.fromJson(response.data);
    }
    return null;
  }
}
