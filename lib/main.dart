import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_exomind/bindings/progress_binding.dart';
import 'package:test_exomind/screens/home_screen.dart';
import 'package:test_exomind/screens/progress_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Cette classe représente le point d'entrée de l'application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
            name: '/progress',
            page: () => const ProgressScreen(),
            binding: ProgressBinding()),
      ],
      initialRoute: '/home', // Route initiale de l'application.
    );
  }
}
