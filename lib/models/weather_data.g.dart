// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      cloudiness: json['cloudiness'] as String,
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'cloudiness': instance.cloudiness,
    };
