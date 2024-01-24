import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> TempData() async {

  /*
  URL pour récupérer le fichier JSON de la température
   */
  const String apiUrl = "http://192.168.1.41/temp";
  final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200)
    {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else
    {
      throw Exception('Échec de la requête HTTP');
    }
 }

Future<Map<String, dynamic>> LightData2() async
{
  /*
  URL pour récupérer le fichier JSON de la luminosité
   */
    const String apiUrl = "http://192.168.1.41/light";
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200)
    {
      Map<String, dynamic> jsonData = json.decode(response.body);
      return jsonData;
    } else
    {
      throw Exception('Échec de la requête HTTP');
    }
}

Future<Map<String, dynamic>> Allume() async
{
  /*
  Je retourne le fichier JSON de l'url pour allumer la led
   */
  const String apiUrl = "http://192.168.1.41/on";
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return jsonData;
  } else
  {
    throw Exception('Échec de la requête HTTP');
  }
}

Future<Map<String, dynamic>> Eteindre() async
{
  /*
  Je retourne le fichier JSON de l'url pour éteindre la led
   */
  const String apiUrl = "http://192.168.1.41/off";
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);
    return jsonData;
  } else
  {
    throw Exception('Échec de la requête HTTP');
  }
}