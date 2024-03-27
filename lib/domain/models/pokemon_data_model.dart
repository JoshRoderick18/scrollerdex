class PokemonData {
  final int id;
  final String name;
  final String sprite;
  final List<StatElement> stats;
  final List<Type> types;

  PokemonData({
    required this.id,
    required this.name,
    required this.sprite,
    required this.stats,
    required this.types,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) => PokemonData(
        id: json["id"],
        name: json["name"],
        sprite: json["sprites"]['other']['home']['front_default'],
        stats: List<StatElement>.from(
            json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );
}

class StatElement {
  final int baseStat;
  final String statName;

  StatElement({
    required this.baseStat,
    required this.statName,
  });

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        statName: json["stat"]['name'],
      );
}

class Type {
  final int slot;
  final String typeName;

  Type({
    required this.slot,
    required this.typeName,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        typeName: json["type"]["name"],
      );
}
