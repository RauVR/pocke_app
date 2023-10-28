class Pokemon{

  String name;

  Pokemon({required this.name});

  Pokemon.fromJson(Map<String, dynamic> json): name=json["name"];
  // De aqui se convierte los datos de la api a formato Json para poder
  // asignarlo a la instancia de Pokemon
}