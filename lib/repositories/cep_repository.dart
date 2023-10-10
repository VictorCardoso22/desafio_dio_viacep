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

  Future<void> post(ViacepModel viacepModel) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/cep',
    );
    try {
      await http.post(url,
          headers: {
            "X-Parse-Application-Id":
                "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
            "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
            "content-type": "application/json"
          },
          body: jsonEncode(viacepModel.toCreateJson()));
    } catch (e) {
      throw e;
    }
  }

  Future<void> update(ViacepModel viacepModel) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/cep/${viacepModel.objectId}',
    );
    try {
      await http.put(url,
          headers: {
            "X-Parse-Application-Id":
                "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
            "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
            "content-type": "application/json"
          },
          body: jsonEncode(viacepModel.toCreateJson()));
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(String objectId) async {
    var url = Uri.parse(
      'https://parseapi.back4app.com/classes/cep/$objectId',
    );
    try {
      await http.delete(
        url,
        headers: {
          "X-Parse-Application-Id": "XE3QwpMiBgJp3yPeMh2Arx2w29Sqth5e5Mjkzwyu",
          "X-Parse-REST-API-Key": "pQY6X4ygrwjZWTPvUH2LUmb2Tz6gI6Zkssykj8Zq",
          "content-type": "application/json"
        },
      );
    } catch (e) {
      throw e;
    }
  }
}
