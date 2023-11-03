import 'package:flutter/material.dart';
import 'package:pocke_app/screens/about_me.dart';
import 'package:pocke_app/screens/favorites_list.dart';
import 'package:pocke_app/screens/pokemon_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  final List<Widget> _children=[
    const PokemonList(),
    const FavoritesList(),
    const AboutMe(),
  ];

  void _changeTab(int index){
    setState(() {
      _selectedTab=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Pokedex")),
      ),
      body: _children[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _changeTab,
        selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "About Me"),
        ],
      ),
    );
  }
}
