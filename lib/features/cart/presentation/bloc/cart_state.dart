part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Map<Product, int> cartItems;

  CartLoaded(this.cartItems);

  List<Object?> get props => [cartItems];
}
