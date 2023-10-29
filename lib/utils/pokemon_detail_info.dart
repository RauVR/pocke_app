// import 'package:flutter/material.dart';
// import 'package:pocke_app/models/pokemon.dart';
// import 'package:pocke_app/utils/functions.dart';
//
// class PokemonDetailInfo extends StatefulWidget {
//   final PokemonInfo pokemonInfo;
//   const PokemonDetailInfo({super.key, required this.pokemonInfo});
//
//   @override
//   State<PokemonDetailInfo> createState() => _PokemonDetailInfoState();
// }
//
// class _PokemonDetailInfoState extends State<PokemonDetailInfo> {
//
//   @override
//   Widget build(BuildContext context) {
//     //final image = NetworkImage(widget.pokemonInfo.urlImage);
//     final image = getImage(widget)
//
//     return Column(
//
//       children: [
//         Image(image: image,height: 250),
//         const SizedBox(height: 20),
//         Text(widget.pokemonInfo.name,style: TextStyle(fontSize: 30)),
//         const SizedBox(height: 30),
//
//         Container(
//           height: 50,
//           alignment: Alignment.center,
//           child: ListView.builder(
//
//             scrollDirection: Axis.horizontal,
//             itemCount: widget.pokemonInfo.types.length,
//             itemBuilder: ((context, index) => Padding(
//               padding: const EdgeInsets.only(left: 10,right: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.deepOrangeAccent),
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.pink
//                 ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       widget.pokemonInfo.types[index],
//                       style: const TextStyle(
//                           fontSize: 20,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold
//                       ),
//
//
//                     ),
//                   )
//               ),
//
//             )),
//           ),
//         ),
//
//
//       ],
//     );
//   }
// }
