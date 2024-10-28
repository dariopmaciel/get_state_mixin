// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';

import 'package:get_state_mixin/repository/via_cep_repository.dart';

class HomeController extends GetxController {
  final ViaCepRepository _repository;

  final _cepSearch = ''.obs;
  final _cep = Rxn<CepModel>();
  final _loading = false.obs;
  final _error = false.obs;

  //*o set e o get não deixam disponigibilizar para fora a variavel observada, a não ser que seja realmente necessário
  //diponibilizando a variavel 'string' e não a variavel Rx
  //proximo a private constructor
  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  CepModel? get cep => _cep.value;
  bool get loading => _loading.value;
  bool get isError => _error.value;

  HomeController(this._repository);

  Future<void> findAddress() async {
    try {
      _error(false);
      _loading(true);
      await 1.seconds.delay();
      // final cep = await _repository.getCep(_cepSearch.value);
      final cep = await _findAddressRepository();
      _cep(cep);
      _loading(false);
    } on Exception catch (e) {
      _error(true);
    } finally {
      _loading(false);
    }
  }

  Future<CepModel> _findAddressRepository() async =>
      await _repository.getCep(_cepSearch.value);
}
