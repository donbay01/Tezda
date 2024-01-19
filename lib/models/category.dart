class Category {
  final dynamic id;
  final dynamic name;
  final dynamic image;

  Category(
    this.id,
    this.name,
    this.image,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  Category.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];
}
