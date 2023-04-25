part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Map<Product, int> cartItems;
  final double totalPrice;

  CartLoaded(this.cartItems, this.totalPrice);

  List<Object?> get props => [cartItems, totalPrice];
}
