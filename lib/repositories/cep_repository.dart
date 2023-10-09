import 'dart:convert';

import 'package:desafio_dio_viacep/model/viacep_model.dart';
import 'package:http/http.dart' as http;

class CepRepository {
  Future<CepBack4AppModel> get() async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/cep',
    );
    var response = await http.get(url, headers: {
      "X-Parse-Application-Id": "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
      "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
      "content-type": "application/json"
    });
    var json = jsonDecode(response.body);

    return CepBack4AppModel.fromJson(json);
  }
}
