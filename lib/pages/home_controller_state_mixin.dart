// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';

import 'package:get_state_mixin/repository/via_cep_repository.dart';

//!Só pode ter um estado no StateMixin como variável de sucesso, Geralmente para telas mais simples, quando se quer apenas sucesso, erro e loading.
class HomeControllerStateMixin extends GetxController
    with StateMixin<CepModel> {
  final ViaCepRepository _repository;
  final _cepSearch = ''.obs;

  HomeControllerStateMixin(this._repository);

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  //  Future<void> findAddress() async {
  //   try {
  //     _error(false);
  //     _loading(true);
  //     await 1.seconds.delay();
  //     final cep = await _repository.getCep(_cepSearch.value);
  //     _cep(cep);
  //     _loading(false);
  //   } on Exception catch (e) {
  //     _error(true);
  //   } finally {
  //     _loading(false);
  //   }
  // }
//!como substituir por stateMixin
  Future<void> findAddress() async {
    try {
      // _error(false);
      // _loading(true);
      change(state, status: RxStatus.loading());
      await 1.seconds.delay();
      final cep = await _repository.getCep(_cepSearch.value);
      // _cep(cep);
      // _loading(false);
      change(state, status: RxStatus.success());
    } catch (e) {
      // _error(true);
      change(state, status: RxStatus.error());
    }
    // finally {
    // _loading(false);
    // }
  }
}