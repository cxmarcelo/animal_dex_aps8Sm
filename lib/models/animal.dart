class Animal {
  final int id;
  final String popularName;
  final String specie;
  final String familly;
  final String orderName;
  final String phylum;
  final bool poisonous;
  final String description;
  final String weight;
  final String height;
  final int imageId;
  final String type;

  const Animal(
    this.id,
    this.popularName,
    this.specie,
    this.familly,
    this.orderName,
    this.phylum,
    this.poisonous,
    this.description,
    this.weight,
    this.height,
    this.imageId,
    this.type,
  );

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      json["id"],
      json["popularName"],
      json["specie"],
      json["familly"],
      json["orderName"],
      json["phylum"],
      json["poisonous"],
      json["description"],
      json["weight"],
      json["height"],
      json["imageId"],
      json["type"],
    );
  }
}
