import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pocke_app/models/pokemon.dart';

class PokemonService {
  final baseUrl="https://pokeapi.co/api/v2/pokemon/";

  Future<List> getAllPokemons() async {
    http.Response response = await http.get(Uri.parse(baseUrl));

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse=json.decode(response.body);
      final pokemonsMap = jsonResponse["results"];
      return pokemonsMap.map((map)=>Pokemon.fromJson(map)).toList();
    }
    return [];
  }

  Future<PokemonInfo?> getPokemonById(int id) async {

    http.Response response = await http.get(Uri.parse("$baseUrl$id"));
    final PokemonInfo? pokemonInfo;

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse=json.decode(response.body);
      pokemonInfo = PokemonInfo.fromJson(jsonResponse);
      return pokemonInfo;
      //return pokemonsMap.map((map)=>Pokemon.fromJson(map)).toList();
    }
    return null;

  }

}