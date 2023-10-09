class CepBack4AppModel {
  List<ViacepModel>? results;

  CepBack4AppModel({this.results});

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ViacepModel>[];
      json['results'].forEach((v) {
        results!.add(ViacepModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViacepModel {
  String? objectId;
  String? createdAt;
  String? updatedAt;
  String? cidade;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  ViacepModel(
      {this.objectId,
      this.createdAt,
      this.updatedAt,
      this.cidade,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  ViacepModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cidade = json['cidade'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['cidade'] = cidade;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}
