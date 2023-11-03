import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pocke_app/models/pokemon.dart';

class PokemonService {
  final baseUrl="https://pokeapi.co/api/v2/pokemon/";

  Future<List<Pokemon>?> getAllPokemons(int page, int size) async {
    http.Response response = await http.get(Uri.parse("$baseUrl?offset=${page*size}&limit=$size"));

    if(response.statusCode==HttpStatus.ok){
      final jsonResponse=json.decode(response.body);
      log(response.body);
      final List maps = jsonResponse["results"];
      final pokemons =  maps.map((map)=>Pokemon.fromJson(map)).toList();
      return pokemons;
    }
    return [];
  }

  Future<PokemonInfo?> getPokemonById(String id) async {

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