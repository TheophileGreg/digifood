part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;

  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;

  RemoveFromCartEvent(this.product);
}
