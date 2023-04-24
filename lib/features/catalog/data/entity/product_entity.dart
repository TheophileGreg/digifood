import 'package:digifood/core/errors/errors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class ProductEntity {
  final String id;
  final String name;
  final String imageURL;
  final String description;
  final double priceATI;
  final double priceWT;
  final double tva;
  final List<String> categories;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.description,
    required this.priceATI,
    required this.priceWT,
    required this.tva,
    required this.categories,
  });

  static ProductEntity fromSnapshot(DocumentSnapshot snap) {
    try {
      return ProductEntity(
        id: snap.id,
        name: snap.get('name') as String,
        description: snap.get('description') as String,
        imageURL: snap.get('imageURL') as String,
        priceATI: snap.get('priceATI').toDouble() as double,
        priceWT: snap.get('priceWT').toDouble() as double,
        tva: snap.get('tva').toDouble() as double,
        categories: List<String>.from(snap.get('category')),
      );
    } catch (e) {
      throw SerializationError();
    }
  }
}
