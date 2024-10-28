// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_state_mixin/models/cep_model.dart';
import 'package:get_state_mixin/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

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
            Obx(() => Visibility(
                visible: controller.loading,
                child:
                    const Center(child: CircularProgressIndicator.adaptive()))),
            Obx(
              () => Visibility(
                  visible: controller.isError,
                  child: const Text('Erro ao buscar CEP!')),
            ),
            Obx(() {
              return Visibility(
                visible: !controller.loading,
                child: CEPWidget(controller.cep),
              );
            })
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
