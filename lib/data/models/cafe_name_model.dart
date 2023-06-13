class CoffeeShop {
  String name;
  double rating;
  String vicinity;

  CoffeeShop(this.name, this.rating, this.vicinity);

  factory CoffeeShop.fromJson(Map<String, dynamic> json) {
    return CoffeeShop(
      json['name'],
      json['rating'].toDouble(),
      json['vicinity'],
    );
  }
}
