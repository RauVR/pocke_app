class Pokemon{

  String name;

  Pokemon({required this.name});

  Pokemon.fromJson(Map<String, dynamic> json): name=json["name"];
  // De aqui se convierte los datos de la api a formato Json para poder
  // asignarlo a la instancia de Pokemon
}

class PokemonInfo{
  String name;
  int weight;
  int height;
  List types;
  List stats;
  String urlImage;

  PokemonInfo({
    required this.name,
    required this.weight,
    required this.height,
    required this.types,
    required this.stats,
    required this.urlImage,
  });

  PokemonInfo.fromJson(Map<String, dynamic> json):
        name= json["name"],
        height=json["height"],
        weight=json["weight"],
        types=json["types"].map((map)=>map["type"]["name"]).toList(),
        stats=json["stats"].map((map)=>Stat.fromJson(map)).toList(),
        urlImage=json["sprites"]["other"]["home"]["front_default"];
}

class Stat{
  String name;
  int value;

  Stat({required this.name,required this.value});

  Stat.fromJson(Map<String,dynamic>json):
        name=json["stat"]["name"],
        value = json["base_stat"];
}