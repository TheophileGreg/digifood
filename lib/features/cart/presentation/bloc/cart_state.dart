part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final Map<Product, int> cartItems;
  final double totalPrice;

  CartLoaded(this.cartItems, this.totalPrice);

  @override
  List<Object?> get props => [cartItems, totalPrice];
}
