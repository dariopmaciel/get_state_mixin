import 'package:get/get.dart';
import 'package:get_state_mixin/pages/home_controller.dart';
import 'package:get_state_mixin/pages/home_controller_state_mixin.dart';
import 'package:get_state_mixin/pages/home_super_controller.dart';
import 'package:get_state_mixin/repository/via_cep_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViaCepRepository());
    Get.put(HomeController(Get.find()));
    Get.put(HomeControllerStateMixin(Get.find()));
    Get.put(HomeSuperController(Get.find()));
  }
}
