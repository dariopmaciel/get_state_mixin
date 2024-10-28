// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:get_state_mixin/repository/via_cep_repository.dart';

class HomeController extends GetxController {
  final ViaCepRepository _viaCepRepository;
  HomeController(this._viaCepRepository);
}
