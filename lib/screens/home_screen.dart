import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Cette classe représente l'écran d'accueil de l'application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Application Météo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Bienvenue sur l\'écran d\'accueil'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                      "/progress"); // Navigue vers l'écran de progression
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurple),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.resolveWith((states) =>
                      Size(MediaQuery.of(context).size.width, 50.0)),
                ),
                child: const Text('Commencer'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
