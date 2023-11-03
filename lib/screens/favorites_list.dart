import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocke_app/models/pokemon.dart';
import 'package:pocke_app/repositories/pokemon_repository.dart';
import 'package:pocke_app/utils/functions.dart';

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
    return GridView.builder(
        itemCount: _pokemons?.length ?? 0, // esto puede devolver null asi q usams elvis
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.deepPurple[100],
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children:
                        [
                          Text(
                              _pokemons?[index].name.toUpperCase()??'None',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                          ),
                          Image(
                            image: getLargeImage(_pokemons?[index].id??'0'),
                            height: 150,
                          ),
                          SizedBox(height: 25,),
                          Text("Pokemon #${_pokemons?[index].id??" "}")
                        ]
                    ),
                  ],
                ),
              ),

            ),
          );
        },
    );
  }
}

/*class FavoriteGrid extends StatefulWidget {
  const FavoriteGrid({super.key});

  @override
  State<FavoriteGrid> createState() => _FavoriteGridState();
}

class _FavoriteGridState extends State<FavoriteGrid> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}*/
