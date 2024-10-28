import 'package:get/get.dart';
import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/repository/via_cep_repository.dart';

class HomeSuperController extends SuperController<CepModel> {
  final ViaCepRepository _repository;
  final _cepSearch = ''.obs;

  HomeSuperController(this._repository);

  @override
  void onDetached() {
    print('onDetached');
  }

  @override
  void onHidden() {
    print('onHidden');
  }

  @override
  void onInactive() {
    print('onInactive');
  }

  @override
  void onPaused() {
    print('onPaused');
  }

  @override
  void onResumed() {
    print('onResumed');
  }

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;

  @override
  void onReady() {
    change(state, status: RxStatus.empty());
  }

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
      await 2.seconds.delay();
      final cep = await _findAddressRepository();
      // _cep(cep);
      // _loading(false);
      change(cep, status: RxStatus.success());
    } catch (e) {
      // _error(true);
      change(state, status: RxStatus.error());
    }
    // finally {
    // _loading(false);
    // }
  }

  Future<void> findAddress2() async {
    change(state, status: RxStatus.loading());
    // append(
    //   () => () {
    //     final cep = _cepSearch.value;
    //     return _repository.getCep(cep);
    //   },
    // );
    //! igual ao de baixo
    // append(() => () => _repository.getCep(_cepSearch.value));
    //! igual ao de baixo
    append(() => _findAddressRepository);
  }

  Future<CepModel> _findAddressRepository() async =>
      await _repository.getCep(_cepSearch.value);
}
