import 'dart:convert';

import 'package:desafio_dio_viacep/model/viacep_mode.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViacepViewlModel extends BaseViewModel {
  String cidade = '';
  String estado = '';
  String endereco = '';
  ViacepViewlModel();

  getCEP(String cep) async {
    var url = Uri.parse(
      'https://viacep.com.br/ws/$cep/json/',
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var viacep = ViacepModel.fromJson(json);
    print(viacep.localidade);
    cidade = viacep.localidade!;
    estado = viacep.uf!;
    endereco = viacep.logradouro!;
    notifyListeners();
  }
}
