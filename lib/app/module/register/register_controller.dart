import 'package:auresgate/app/data/models/cidade_model.dart';
import 'package:auresgate/app/data/models/endereco_model.dart';
import 'package:auresgate/app/data/models/estado_model.dart';
import 'package:auresgate/app/data/models/ong_model.dart';
import 'package:auresgate/app/data/models/pessoa_model.dart';
import 'package:auresgate/app/data/repository/city_repository.dart';
import 'package:auresgate/app/data/repository/ong_repository.dart';
import 'package:auresgate/app/data/repository/person_repository.dart';
import 'package:auresgate/app/data/repository/state_repository.dart';
import 'package:auresgate/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final PersonsRepository _personsRepository;
  final StatesRepository _stateRepository;
  final CityRepository _cityRepository;
  final OngRepository _ongRepository;
  RegisterController(this._personsRepository, this._stateRepository,
      this._cityRepository, this._ongRepository);

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final formKeyAuth = GlobalKey<FormState>();

  final _optUsers = 0.obs;
  get optUsers => this._optUsers.value;
  set optUsers(value) => this._optUsers.value = value;

  final _isPessoa = false.obs;
  bool get isPessoa => _isPessoa.value;
  set isPessoa(bool value) => _isPessoa.value = value;

  final _pessoa = Pessoa.empty().obs;
  Pessoa get pessoa => _pessoa.value;

  final _pessoaEditing = Pessoa.empty().obs;
  Pessoa get pessoaEditing => _pessoaEditing.value;

  final _isOng = false.obs;
  bool get isOng => _isOng.value;
  set isOng(bool value) => _isOng.value = value;

  final _ong = Ong.empty().obs;
  Ong get ong => _ong.value;

  final _ongEditing = Ong.empty().obs;
  Ong get ongEditing => _ongEditing.value;

  final _showPassword = false.obs;
  bool get showPassword => _showPassword.value;
  set showPassword(bool value) => _showPassword.value = value;

  final _isSelectedState = false.obs;
  bool get isSelectedState => _isSelectedState.value;
  set isSelectedState(bool value) => _isSelectedState.value = value;

  final _states = <Estado>[].obs;
  List<Estado> get states => _states.toList();

  final _selectedStates = Estado.empty().obs;
  Estado get selectedStates => _selectedStates.value;

  final _selectedSexValue = 'Sexo'.obs;
  String get selectedSexValue => _selectedSexValue.value;
  set selectedSexValue(String value) => _selectedSexValue.value = value;

  final _sex = <String>['Sexo', 'MASCULINO', 'FEMININO'].obs;
  List<String> get sex => _sex.toList();
  
  final _isSelectedCity = false.obs;
  bool get isSelectedCity => _isSelectedCity.value;
  set isSelectedCity(bool value) => _isSelectedCity.value = value;

  final _citys = <Cidade>[].obs;
  List<Cidade> get citys => _citys.toList();

  final _selectedCity = Cidade.empty().obs;
  Cidade get selectedCity => _selectedCity.value;

  @override
  void onInit() {
    super.onInit();
    listStates();
  }

  void onChangeUser(
      {int? idade,
      String? sexo,
      String? nome,
      String? usuario,
      String? email,
      String? cnpj,
      String? telefone,
      String? senha,
      String? bairro,
      int? numero,
      String? complemento,
      int? cidade}) {
    _pessoaEditing.value = _pessoaEditing.value.copyWith(
        idade: idade,
        sexo: sexo,
        nome: nome,
        usuario: usuario,
        email: email,
        telefone: telefone,
        senha: senha,
        bairro: bairro,
        numero: numero,
        complemento: complemento,
        cidade: cidade);

    _ongEditing.value = _ongEditing.value.copyWith(
        nome: nome,
        email: email,
        cnpj: cnpj,
        telefone: telefone,
        senha: senha,
        bairro: bairro,
        numero: numero,
        complemento: complemento,
        cidade: cidade);
  }

  void onSave() async {
    _pessoa.value = _pessoaEditing.value;
    _ong.value = _ongEditing.value;
    var response;
    if (isPessoa) {
      response = await _personsRepository.createUserPerson(pessoa);
    } else {
      response = await _ongRepository.createOng(ong);
    }

    if (response == null) {
      Get.offNamed(Routes.LOGIN);
    }
  }

  //SELECIONAR ESTADO
  void selectedState(String? id) {
    _isSelectedState.value = false;
    for (Estado state in states) {
      if (state.id == int.parse(id!)) {
        _selectedStates.value = state;
      }
    }
    listCity(_selectedStates.value.id.toString());
    _isSelectedCity.value = false;
    _isSelectedState.value = true;
  }

  void listStates() async {
    var response = await _stateRepository.listStates();
    _states.value = response;
  }

  //

  //SELECIONAR CIDADE
  void selectedCitys(String? id) {
    _isSelectedCity.value = false;
    for (Cidade city in citys) {
      if (city.id == int.parse(id!)) {
        _selectedCity.value = city;
      }
    }
    _isSelectedCity.value = true;
  }

  void listCity(String id) async {
    var response = await _cityRepository.listCity(id);
    _citys.value = response;
  }
  //
}
