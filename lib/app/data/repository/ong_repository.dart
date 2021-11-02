import 'package:auresgate/app/data/models/ong_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class OngRepository extends ApiBase {
  OngRepository() : super('/ongs');

  Future<Ong?> createOng(Ong ong) async {
    var response = await client.post('', data: ong.toJson());

    if (response.statusCode == 200 && response.data != null) {
      return ong.fromJson(response.data);
    }

    return null;
  }
}
