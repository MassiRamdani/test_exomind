// Modèle de données pour stocker les informations météo.
import 'package:json_annotation/json_annotation.dart';
part 'weather_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class WeatherData {
  final String city; // Nom de la ville
  final double temperature; // Température en kelvins
  final String cloudiness; // Description de la couverture nuageuse

  WeatherData({
    required this.city,
    required this.temperature,
    required this.cloudiness,
  });

  // Constructeur de fabrique pour la désérialisation JSON
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return _$WeatherDataFromJson(json);
  }

  // Méthode pour la sérialisation en JSON
  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
