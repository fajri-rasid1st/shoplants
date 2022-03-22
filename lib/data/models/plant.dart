class Plant {
  final String name;
  final String alias;
  final int price;
  final String about;
  final List<String> characteristics;
  final List<String> imgUrls;

  const Plant({
    required this.name,
    required this.alias,
    required this.price,
    required this.about,
    required this.characteristics,
    required this.imgUrls,
  });

  @override
  String toString() {
    return 'Plant(name: $name, alias: $alias, price: $price, about: $about, characteristics: $characteristics, imgUrls: $imgUrls)';
  }
}
