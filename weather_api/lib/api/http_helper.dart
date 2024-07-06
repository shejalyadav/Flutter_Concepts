
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_api/entity/weather.dart';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '7fbb9587100e683f51d6fc398b7f3253';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameter = {
      'q': location,
      'appId': apiKey
    };

    Uri uri = Uri.https(authority, path, parameter);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weatherData = Weather.fromJson(data);
    return weatherData;
  }
}