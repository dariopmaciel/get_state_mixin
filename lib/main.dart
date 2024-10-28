import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_mixin/pages/home_bindings.dart';
import 'package:get_state_mixin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get State Mixin - Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blue,
        useMaterial3: false,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBindings(),
          page: () => const HomePage(),
        ),
      ],
    );
  }
}
