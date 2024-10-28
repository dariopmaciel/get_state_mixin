// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/pages/home_controller.dart';
import 'package:get_state_mixin/pages/home_controller_state_mixin.dart';
import 'package:get_state_mixin/pages/home_super_controller.dart';

class HomePage extends StatelessWidget {
  // final controller = Get.find<HomeController>();
  // final controller = Get.find<HomeControllerStateMixin>();
  final controller = Get.find<HomeSuperController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Endereço por CEP Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                controller.cepSearch = value;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  controller.findAddress();
                },
                child: const Text("Buscar")),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  controller.findAddress2();
                },
                child: const Text("Buscar2")),
            const SizedBox(height: 20),
            // Obx(() => Visibility(
            //     visible: controller.loading,
            //     child:
            //         const Center(child: CircularProgressIndicator.adaptive()))),
            // Obx(() => Visibility(
            //     visible: controller.isError,
            //     child: const Text('Erro ao buscar CEP!'))),
            // Obx(() {
            //   return Visibility(
            //       visible: !controller.loading,
            //       child: CEPWidget(controller.cep));
            // })
            //!como substituir por stateMixin
            controller.obx(
              (state) => CEPWidget(state),
              onEmpty: const Text('Nenhum CEP encontrado'),
              onLoading: const Text('Carregando...'),
              onError: (erro) => const Text(
                '* Erro ao buscar CEP',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}

class CEPWidget extends StatelessWidget {
  final CepModel? cepModel;

  const CEPWidget(this.cepModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("CEP: ${cepModel?.cep ?? ''}"),
        Text("CIDADE: ${cepModel?.localidade ?? ''}"),
        Text("RUA: ${cepModel?.logradouro ?? ''}"),
        Text("UF: ${cepModel?.uf ?? ''}"),
      ],
    );
  }
}
