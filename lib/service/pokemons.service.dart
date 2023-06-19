import 'dart:convert';

import 'package:http/http.dart' as http;

class Pokemon {
  static Future<Map?> getAllPokemons() async {
    const url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      return null;
    }
  }

  
}
