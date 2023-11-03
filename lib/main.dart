import 'package:flutter/material.dart';
import 'package:pocke_app/screens/home.dart';
import 'package:pocke_app/screens/pokemon_list.dart';
import 'package:pocke_app/services/pokemon_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget{
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  PokemonService? service;
  List? pokemons; //variable puede ser nula

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Home()// le aseguro que no sera nulo
          ),
        ),
      ),
    );
  }


}


