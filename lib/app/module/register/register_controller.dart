import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/pessoa_model.dart';
import 'package:auresgate/app/data/repository/person_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final PersonsRepository _personsRepository;
  RegisterController(this._personsRepository);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final formKeyAuth = GlobalKey<FormState>();

  final _pessoa = Pessoa.empty().obs;
  Pessoa get pessoa => _pessoa.value;

  final _pessoaEditing = Pessoa.empty().obs;
  Pessoa get pessoaEditing => _pessoaEditing.value;
  set pessoaEditing(Pessoa value) => _pessoaEditing.value = value;

  final _showPassword = false.obs;
  bool get showPassword => _showPassword.value;
  set showPassword(bool value) => _showPassword.value = value;

  void onChangeUser(
      {int? idade,
      String? sexo,
      String? nome,
      String? email,
      String? telefone,
      String? senha,
      String? bairro,
      String? cep,
      int? numero,
      String? complemento,
      int? cidade}) {
    _pessoaEditing.value = _pessoaEditing.value.copyWith(
        idade: idade,
        sexo: sexo,
        nome: nome,
        email: email,
        telefone: telefone,
        senha: senha,
        bairro: bairro,
        cep: cep,
        numero: numero,
        complemento: complemento,
        cidade: cidade);
  }

  void onSave() {
    _personsRepository.createUserPerson(pessoa);
  }
}
