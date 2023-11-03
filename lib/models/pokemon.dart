import 'package:pocke_app/utils/functions.dart';

class Pokemon{

  final String name;
  final String id;

  const Pokemon({required this.name, required this.id});

  Pokemon.fromJson(Map<String, dynamic> json)
      : name=json["name"],
        id=getId(json["url"]);

  Pokemon.fromMap(Map<String, dynamic> map)
      : name=map['name'],
        id=map['id'];

  Map<String,dynamic> toMap(){
    return{
      'id': id,
      'name':name,
    };
  }

// De aqui se convierte los datos de la api a formato Json para poder
  // asignarlo a la instancia de Pokemon
}

class PokemonInfo{
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<Stat> stats;
  //String urlImage;

  PokemonInfo({
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    //required this.urlImage,
  });

  PokemonInfo.fromJson(Map<String, dynamic> json):
        name= json["name"],
        height=json["height"],
        weight=json["weight"],
        //types=json["types"].map((map)=>map["type"]["name"]).toList(),
        types=json["types"].map<String>((type)=>type["type"]["name"].toString()).toList(),
        //stats=json["stats"].map((map)=>Stat.fromJson(map)).toList();
        stats=json["stats"].map<Stat>((stat)=>Stat.fromJson(stat)).toList().cast<Stat>();
        //urlImage=json["sprites"]["other"]["home"]["front_default"];
}

class Stat{
  String name;
  int value;

  Stat({required this.name,required this.value});

  Stat.fromJson(Map<String,dynamic>json):
        name=json["stat"]["name"],
        value = json["base_stat"];
}