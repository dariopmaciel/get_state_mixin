import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';
// busca do serviço

class ViaCepRepository extends GetConnect {
  Future<CepModel> getCep(String cep) async {
    // final result = await get('http://https://viacep.com.br/ws/01001000/json/');
    final result = await get('https://viacep.com.br/ws/$cep/json/');
    if (result.hasError) {
      log('Erro ao buscar CEP', error: result.statusText);
      throw Exception('Erro ao buscar CEP');
    }
    return CepModel.fromMap(result.body);
  }
}
