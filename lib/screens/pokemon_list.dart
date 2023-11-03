import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pocke_app/repositories/pokemon_repository.dart';
import 'package:pocke_app/screens/pokemon_detail.dart';
import 'package:pocke_app/services/pokemon_service.dart';
import 'package:pocke_app/utils/pokemon_item.dart';

import '../models/pokemon.dart';
import '../utils/functions.dart';

class PokemonList extends StatefulWidget {

  const PokemonList({super.key});
  //final List? pokemons;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  //List<Pokemon>? _pokemons;
  PokemonService? _pokemonService;
  final _pageSize = 20;


  final PagingController<int, Pokemon> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pokemonService=PokemonService();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    //initialize();
    super.initState();
  }

  Future _fetchPage(int pageKey) async {
    try {
      final pokemons = await _pokemonService?.getAllPokemons(pageKey, _pageSize)??[];
      // Aqui consulta al api atravez del service para jalar todos los pokemones

      final isLastPage = pokemons.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(pokemons);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(pokemons, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
    // setState(() {
    //   _pokemons=_pokemons;
    // });
  }

/*  Future initialize() async {
    _pokemons=await _pokemonService?.getAllPokemons(0,PokemonList._pageSize);
    setState(() {
      _pokemons=_pokemons;
    });
  }*/

  
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Pokemon>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) => PokemonItem(
          pokemon: item,
        ),
      ),
    );

    /*ListView.builder(
        itemCount: _pokemons?.length??0,
        itemBuilder: (context, index) => PokemonItem(pokemon: _pokemons?[index]),
    );*/
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

}



// ------------------------------------------------------------

class PokemonItem extends StatefulWidget {
  final Pokemon? pokemon;
  //final int index;

  const PokemonItem({super.key,required this.pokemon});

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}



class _PokemonItemState extends State<PokemonItem> {
  //late NetworkImage image;
  bool isFavorite=false;

  @override
  void initState() {
    initialize();
    //isFavorite=false;
    super.initState();
  }
  
  initialize() async {
    isFavorite = await PokemonRepository().isFavorite(widget.pokemon!);

    if(mounted){ //cuando la vista esta montada recien puedo dar a favoritos
      setState(() {
        isFavorite=isFavorite;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {

    final image =  getImage(widget.pokemon?.id??"");
    final icon=Icon(Icons.favorite, color: isFavorite? Colors.red : Colors.black45,);
    final pokemon = widget.pokemon;

    //image= NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.index+1}.png");

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetail(id:pokemon?.id?? "1"),)),
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 15),
                    child: Text(widget.pokemon?.id??"",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  Image(image: image),
                  Text(widget.pokemon?.name??"",style: const TextStyle(fontSize: 18)),
                ],
              ),

              IconButton(
                onPressed: () { setState(() {isFavorite = !isFavorite;});
                  isFavorite
                      ? PokemonRepository().insert(pokemon!)
                      : PokemonRepository().delete(pokemon!);
                  },
                icon: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


