import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocke_app/models/pokemon.dart';
import 'package:pocke_app/repositories/pokemon_repository.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {

  PokemonRepository? _pokemonRepository;
  List<Pokemon>? _pokemons;

  initialize() async {
    _pokemons = await _pokemonRepository?.getAll() ?? []; // se usa elvis por si retorna null
    setState(() {
      _pokemons = _pokemons;
    });
  }

  @override
  void initState() {
    _pokemonRepository = PokemonRepository();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _pokemons?.length ?? 0, // esto puede devolver null asi q usams elvis
        itemBuilder: (context, index) {
          return Text(_pokemons?[index].name??'');
        },
    );
  }
}
