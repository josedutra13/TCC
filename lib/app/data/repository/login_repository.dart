import 'package:auresgate/app/data/models/userDTO_model.dart';
import 'package:auresgate/app/data/providers/api.dart';

class LoginRepository extends ApiBase {
  LoginRepository() : super('/login');

  Future<UserDTO?> login(String username, String senha) async {
    Map<String, dynamic> params = {'nomeUsuario': username, 'senha': senha};
    var response = await client.get('', queryParameters: params);

    if (response.statusCode == 200 && response.data != null) {
      return UserDTO.fromJson(response.data);
    }

    return null;
  }

  Future<UserDTO?> emailConfirm(String email) async {
    Map<String, dynamic> params = {'email': email};
    var response = await client.get('/email', queryParameters: params);

    if (response.statusCode == 200 && response.data != null) {
      return UserDTO.fromJson(response.data);
    }

    return null;
  }

  Future<void> changePass(UserDTO user, String novaSenha) async {
    Map<String, dynamic> params = {'novaSenha': novaSenha};
    print('USER E ABUSE : ${user.isPerson}');
    await client.put('/alterarSenha',
        queryParameters: params, data: user.toJson());
  }
}
