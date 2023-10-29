// import 'package:flutter/material.dart';
// import 'package:pocke_app/screens/pokemon_detail.dart';
//
// import '../models/pokemon.dart';
// import 'functions.dart';
//
// class PokemonItem extends StatefulWidget {
//   final Pokemon? pokemon;
//   //final int index;
//
//   const PokemonItem({super.key,required this.pokemon});
//
//   @override
//   State<PokemonItem> createState() => _PokemonItemState();
// }
//
// class _PokemonItemState extends State<PokemonItem> {
//   //late NetworkImage image;
//   late bool isFavorite;
//
//   @override
//   void initState() {
//     isFavorite=false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final image =  getImage(widget.pokemon?.id ?? "");
//     final icon=Icon(Icons.favorite, color: isFavorite? Colors.red : Colors.grey,);
//     final pokemon = widget.pokemon;
//
//     //image= NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.index+1}.png");
//
//     return GestureDetector(
//       onTap: () =>
//         Navigator.push(
//             context, MaterialPageRoute(
//             builder: (context) => PokemonDetail(id:pokemon?.id?? "1"),
//         )
//         ),
//       child: Card(
//         color: Colors.green,
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.only(right: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//
//               Row(
//                 children: [
//                   Image(image: image),
//                   Text(widget.pokemon?.name??"",style: const TextStyle(fontSize: 18)),
//                 ],
//               ),
//
//               IconButton(
//                   onPressed: () { setState(() {
//                     isFavorite = !isFavorite;
//                   }); },
//                   icon: icon,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
