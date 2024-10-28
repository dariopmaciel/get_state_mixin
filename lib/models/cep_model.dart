import 'dart:convert';

class CepModel {
  String cep;
  String logradouro;
  String cidade;
  String uf;
  CepModel({
    required this.cep,
    required this.logradouro,
    required this.cidade,
    required this.uf,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'cidade': cidade,
      'uf': uf,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: (map['cep'] ?? '') as String,
      logradouro: (map['logradouro'] ?? '') as String,
      cidade: (map['cidade'] ?? '') as String,
      uf: (map['uf'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
