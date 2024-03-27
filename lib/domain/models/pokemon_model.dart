class Pokemon {
  final String name;
  final String url;

  Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  Pokemon copyWith({
    String? name,
    String? url,
  }) =>
      Pokemon(
        name: name ?? this.name,
        url: url ?? this.url,
      );
}
