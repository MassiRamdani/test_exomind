import 'package:flutter/material.dart';
import 'package:test_exomind/models/weather_data.dart';

import 'loader.dart';

// Ce widget, ItemResult, représente un élément de la liste de résultats affichés.
class ItemResult extends StatelessWidget {
  const ItemResult({super.key, required this.weatherData});
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255, 234, 212, 238),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text('${weatherData.city} '),
        trailing: Text(
          '${(weatherData.temperature - 273.15).toStringAsFixed(1)}°C',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: Image.network(
          getIconCloudiness(weatherData.cloudiness),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Loader();
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
      ),
    );
  }

  // Cette méthode renvoie l'URL de l'icône météo en fonction de la description de la couverture nuageuse.
  String getIconCloudiness(String cloudiness) {
    switch (cloudiness) {
      case "clear sky":
        return "http://openweathermap.org/img/wn/01d@2x.png";

      case "few clouds":
        return "http://openweathermap.org/img/wn/02d@2x.png";

      case "scattered clouds":
        return "http://openweathermap.org/img/wn/03d@2x.png";

      case "broken clouds":
        return "http://openweathermap.org/img/wn/04d@2x.png";
      case "shower rain":
        return "http://openweathermap.org/img/wn/09d@2x.png";
      case "rain":
        return "http://openweathermap.org/img/wn/10d@2x.png";
      case "thunderstorm":
        return "http://openweathermap.org/img/wn/11d@2x.png";
      case "snow":
        return "http://openweathermap.org/img/wn/13d@2x.png";
      case "mist":
        return "http://openweathermap.org/img/wn/50d@2x.png";
      default:
        return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Neutrois.svg/120px-Neutrois.svg.png";
    }
  }
}
