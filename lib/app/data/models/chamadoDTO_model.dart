import 'dart:convert';

import 'package:auresgate/app/data/models/animal_model.dart';
import 'package:auresgate/app/data/models/userDTO_model.dart';
import 'package:flutter/services.dart';

class ChamadoDTO {
  late Animal animal;
  late UserDTO loginDTO;
  late String img;

  ChamadoDTO({required this.animal, required loginDTO, required img});

  ChamadoDTO.fromJson(Map<String, dynamic> json) {
    this.animal = json['animal'];
    this.loginDTO = json['loginDTO'];
    this.img = json['img'];
  }

  ChamadoDTO.empty();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animal'] = this.animal;
    data['loginDTO'] = this.loginDTO;
    data['img'] = this.img;
    return data;
  }
}
