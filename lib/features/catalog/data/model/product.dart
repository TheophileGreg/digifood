import 'package:digifood/features/catalog/data/entity/product_entity.dart';

enum Categories { salt, sugar, food, drink, alcohol, soft }

class Product {
  final String id;
  final String name;
  final String imageURL;
  final String description;
  final double priceATI;
  final double priceWT;
  final double tva;
  final List<Categories> categories;

  const Product(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.description,
      required this.priceATI,
      required this.priceWT,
      required this.tva,
      required this.categories});

  List<Object?> get props =>
      [name, imageURL, description, priceATI, priceWT, tva, categories];

  static Product empty = const Product(
    id: 'Inconnu(e)',
    name: 'Inconnu(e)',
    description: 'Inconnu(e)',
    imageURL: 'Inconnu(e)',
    priceATI: 0.0,
    priceWT: 0.0,
    tva: 0.0,
    categories: [],
  );

  static Product fromEntity(ProductEntity entity) {
    final Product product = Product.empty.copyWith(
      id: entity.id,
      name: entity.name,
      imageURL: entity.imageURL,
      description: entity.description,
      priceATI: entity.priceATI,
      priceWT: entity.priceWT,
      tva: entity.tva,
      categories: entity.categories
          .map((category) =>
              Categories.values.firstWhere((e) => e.toString() == category))
          .toList(),
    );
    return product;
  }

  Product copyWith({
    String? id,
    String? name,
    String? imageURL,
    String? description,
    double? priceATI,
    double? priceWT,
    double? tva,
    List<Categories>? categories,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageURL: imageURL ?? this.imageURL,
      description: description ?? this.description,
      priceATI: priceATI ?? this.priceATI,
      priceWT: priceWT ?? this.priceWT,
      tva: tva ?? this.tva,
      categories: categories ?? this.categories,
    );
  }
}
