import 'package:flutter/material.dart';
import 'package:pocke_app/models/pokemon.dart';
import 'package:pocke_app/services/pokemon_service.dart';
import 'package:pocke_app/utils/functions.dart';
import 'package:pocke_app/utils/pokemon_detail_info.dart';
import 'package:pocke_app/utils/pokemon_item.dart';

class PokemonDetail extends StatefulWidget {
  final String id;
  //final PokemonInfo pokemonInfo; // ya no va reemplazamos por el id
  const PokemonDetail({super.key, required this.id});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  PokemonService? _pokemonService;
  PokemonInfo? _pokemonInfo;

  @override
  void initState() {
    _pokemonService=PokemonService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    _pokemonInfo = await PokemonService().getPokemonById(widget.id);
    setState(() {
      _pokemonInfo=_pokemonInfo;
    });
    // PokemonService no se coloca instancia solo se usa en el await
  }


  @override
  Widget build(BuildContext context) {
    final image = getLargeImage(widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_pokemonInfo?.name??""),
      ),

      body: Column(

        children: [
          const SizedBox(height: 30,),
          Container(

            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(20)
            ),
            child: Image(image: image,height: 250),

          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _pokemonInfo?.types.map((e) => Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                    e,
                    style: const TextStyle(color: Colors.white,fontSize: 20),

                ),
              ),
            ))
            .toList()??
          []),
          const SizedBox(height: 30,),
          Column(
            children: _pokemonInfo?.stats.map((e) => Text(e.name)).toList()??[],
          )
        ],

      ),

      // const Center(child: CircularProgressIndicator())
      //     :PokemonDetailInfo(pokemonInfo: _pokemonInfo!)
    );
  }
}

