import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_exomind/models/weather_data.dart';

// Ce contrôleur GetX, ProgressController, gère l'état et la logique de l'écran de progression.
class ProgressController extends GetxController {
  var progress = 0.0.obs; // La valeur de progression actuelle
  var isProgress = false.obs; // Indique si le chargement est en cours
  var elapsedTime = 0.obs; // Le temps écoulé en secondes
  var weatherDataList = <WeatherData>[].obs; // Liste des données météo
  var currentMessageIndex = 0.obs; // L'index du message de progression actuel
  var isDataLoading = false.obs;
  var progressMessages = <String>[
    "Nous téléchargeons les données…",
    "C’est presque fini…",
    "Plus que quelques secondes avant d’avoir le résultat…"
  ].obs;
  final dio = Dio(); // Instance Dio pour les requêtes HTTP

  @override
  void onInit() {
    initRotatingMessages();
    startProgress();
    super.onInit();
  }

  // Initialise la rotation des messages de progression
  void initRotatingMessages() {
    Timer.periodic(const Duration(seconds: 6), (timer) {
      currentMessageIndex.value =
          (currentMessageIndex.value + 1) % progressMessages.length;
      update();
    });
  }

  // Redémarre le processus de progression
  void restartProgress() {
    isProgress(false);
    progress(0);
    elapsedTime(0);
    currentMessageIndex(0);
    weatherDataList.clear();
    startProgress();
  }

  // Démarre le processus de progression
  void startProgress() {
    // Remplissage de la jauge à 100 % en 60 secondes
    const totalDuration = Duration(seconds: 60);
    const intervalDuration = Duration(seconds: 10);
    isProgress(true);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      progress.value += 1 / totalDuration.inSeconds;

      if (progress.value >= 1.0) {
        timer.cancel();
        isProgress(false);
      }

      if (elapsedTime.value % intervalDuration.inSeconds == 0 &&
          elapsedTime.value <= 40) {
        fetchWeatherDataForCities(getCityName(elapsedTime.value.toInt()));
      }
      elapsedTime.value++;
    });
  }

  // Récupère les données météo pour une ville donnée
  void fetchWeatherDataForCities(String city) async {
    try {
      final response = await dio.get(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=1bf80e19fce75d8f27ea5e096df2ed3b');

      // Gérez la réponse de l'API météo
      final cityName = response.data['name'];
      final temperature = response.data['main']['temp'];
      final cloudiness = response.data['weather'][0]['description'];

      // Mettez à jour la liste des resultats
      weatherDataList.add(WeatherData(
          city: cityName, temperature: temperature, cloudiness: cloudiness));
    } catch (e) {
      // Gérez les erreurs d'API
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text(
              'Erreur lors de la récupération des données pour $city:\n $e')));
    }
  }

  // Détermine quelle ville interroger en fonction du temps écoulé
  String getCityName(int seconds) {
    // Implémenter la logique pour déterminer quelle ville interroger en fonction du temps écoulé.
    // Utiliser une liste de villes et calculer l'indice en fonction du temps.
    final cities = ['Rennes', 'Paris', 'Nantes', 'Bordeaux', 'Lyon'];
    final index = seconds ~/ 10 % cities.length;
    return cities[index];
  }
}
