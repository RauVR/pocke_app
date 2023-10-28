import 'package:flutter/material.dart';
import 'package:pocke_app/utils/pokemon_item.dart';

class PokemonList extends StatefulWidget {

  const PokemonList({super.key, required this.pokemons});
  final List? pokemons;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  @override
  Widget build(BuildContext context) {

    return widget.pokemons==null
        ?const Center(child: CircularProgressIndicator(),)
        :ListView.builder(
          itemCount: (widget.pokemons==null)? 0: widget.pokemons?.length,
          itemBuilder: (context, index) {
            return PokemonItem(pokemon: widget.pokemons?[index],index: index,);
        },
    );
  }
}



