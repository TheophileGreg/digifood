import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digifood/core/errors/errors.dart';
import 'package:digifood/features/catalog/data/entity/product_entity.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:digifood/features/catalog/data/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  late final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<Product> getById(String id) async {
    final snap = await _products.doc(id).get();
    if (!snap.exists) {
      throw NotFoundError();
    }
    return Product.fromEntity(ProductEntity.fromSnapshot(snap));
  }

  @override
  Future<List<Product>> getProducts() async {
    final List<Product> products = [];
    final queryDocumentSnapshot = await _products.get();
    for (final element in queryDocumentSnapshot.docs) {
      if (element.exists) {
        products.add(Product.fromEntity(ProductEntity.fromSnapshot(element)));
      }
    }
    return products;
  }
}
