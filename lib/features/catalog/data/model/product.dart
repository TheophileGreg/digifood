import 'package:digifood/features/catalog/data/entity/product_entity.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:equatable/equatable.dart';

enum Categories { salt, sugar, food, drink, alcohol, soft, other }

class Product extends Equatable {
  final String id;
  final String name;
  final String imageURL;
  final String description;
  final double priceATI;
  final double priceWT;
  final double tva;
  final List<Categories?> categories;

  const Product(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.description,
      required this.priceATI,
      required this.priceWT,
      required this.tva,
      required this.categories});

  @override
  List<Object?> get props =>
      [id, name, imageURL, description, priceATI, priceWT, tva, categories];

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
      categories: EnumToString.fromList(Categories.values, entity.categories),
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
    List<Categories?>? categories,
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
