class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  const Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    final int parsedId = int.tryParse(json['id'].toString()) ?? 0;

    final double parsedPrice = double.tryParse(json['price'].toString()) ?? 0.0;

    final String parsedPizzaName = (json['pizzaName'] != null)
        ? json['pizzaName'].toString()
        : 'No name';

    final String parsedDescription = (json['description'] != null)
        ? json['description'].toString()
        : '';

    final String parsedImageUrl = (json['imageUrl'] != null)
        ? json['imageUrl'].toString()
        : '';

    return Pizza(
      id: parsedId,
      pizzaName: parsedPizzaName,
      description: parsedDescription,
      price: parsedPrice,
      imageUrl: parsedImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
