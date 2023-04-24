import 'dart:async';

import 'package:digifood/features/catalog/data/model/product.dart';

abstract class ProductRepository {
  Future<Product> getById(String id);

  Future<List<Product>> getProducts();
}
