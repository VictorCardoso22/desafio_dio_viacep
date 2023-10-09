import 'dart:convert';

import 'package:desafio_dio_viacep/model/viacep_model.dart';
import 'package:desafio_dio_viacep/repositories/cep_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViacepViewlModel extends BaseViewModel {
  String cidade = '';
  String estado = '';
  String endereco = '';
  String? cep;
  String? bairro;
  String? ibge;
  String? gia;
  List<ViacepModel> listCep = [];
  ViacepViewlModel() {
    readCEP();
  }

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
    bairro = viacep.bairro;
    ibge = viacep.ibge;
    gia = viacep.gia;
    notifyListeners();
  }

  saveCEP(ViacepModel viacepModel) {
    print(viacepModel);
  }

  readCEP() async {
    var cep = CepRepository();
    CepBack4AppModel listCepBack = await cep.get();
    listCepBack.results?.forEach((element) {
      listCep.add(element);
    });
    notifyListeners();
    print(listCep);
    // return listCep.results;
  }
}
