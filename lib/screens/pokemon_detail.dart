import 'package:flutter/material.dart';
import 'package:pocke_app/models/pokemon.dart';
import 'package:pocke_app/services/pokemon_service.dart';
import 'package:pocke_app/utils/pokemon_detail_info.dart';
import 'package:pocke_app/utils/pokemon_item.dart';

class PokemonDetail extends StatefulWidget {
  final int id;
  //final PokemonInfo pokemonInfo; // ya no va reemplazamos por el id
  const PokemonDetail({super.key, required this.id});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  PokemonInfo? pokemonInfo;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    pokemonInfo = await PokemonService().getPokemonById(widget.id);
    setState(() {
      pokemonInfo=pokemonInfo;
    });
    // PokemonService no se coloca instancia solo se usa en el await
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: pokemonInfo==null?
        const Center(child: CircularProgressIndicator())
            :PokemonDetailInfo(pokemonInfo: pokemonInfo!,)
      ),
    );
  }
}
