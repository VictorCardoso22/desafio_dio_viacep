import 'dart:convert';

import 'package:desafio_dio_viacep/model/viacep_model.dart';
import 'package:desafio_dio_viacep/repositories/cep_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class ViacepViewlModel extends BaseViewModel {
  List<ViacepModel> listCep = [];
  ViacepModel viacepModel = ViacepModel();
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
    viacepModel = ViacepModel.create(
      cep: viacep.cep,
      bairro: viacep.bairro,
      complemento: viacep.complemento,
      ddd: viacep.ddd,
      gia: viacep.gia,
      ibge: viacep.ibge,
      localidade: viacep.localidade,
      logradouro: viacep.logradouro,
      siafi: viacep.siafi,
      uf: viacep.uf,
    );

    notifyListeners();
  }

  saveCEP(ViacepModel viacepModel) async {
    var cep = CepRepository();

    await cep.post(ViacepModel.create(
      cep: viacepModel.cep,
      bairro: viacepModel.bairro,
      complemento: viacepModel.complemento,
      ddd: viacepModel.ddd,
      gia: viacepModel.gia,
      ibge: viacepModel.ibge,
      localidade: viacepModel.localidade,
      logradouro: viacepModel.logradouro,
      siafi: viacepModel.siafi,
      uf: viacepModel.uf,
    ));
    listCep.clear();
    await readCEP();
    notifyListeners();
  }

  readCEP() async {
    var cep = CepRepository();
    CepBack4AppModel listCepBack = await cep.get();
    listCepBack.results?.forEach((element) {
      listCep.add(element);
    });
    notifyListeners();
  }

  deleteCEP(String id) async {
    var cep = CepRepository();
    print(id);
    await cep.delete(id);
    listCep.clear();
    await readCEP();
    notifyListeners();
  }
}
