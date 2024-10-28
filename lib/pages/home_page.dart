import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            TextFormField(),
            ElevatedButton(
                onPressed: () {
                  //
                },
                child: const Text("Buscar")),
            const SizedBox(height: 20),
            CEPWidget(),
          ],
        ),
      ),
    );
  }
}

class CEPWidget extends StatelessWidget {
  const CEPWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("CEP"),
        Text("CIDADE"),
        Text("RUA"),
        Text("UF"),
      ],
    );
  }
}
