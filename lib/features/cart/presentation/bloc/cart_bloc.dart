import 'package:bloc/bloc.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  Map<Product, int> cartItems = {};
  double totalPrice = 0;
  CartBloc()
      : super(
          CartLoaded(const {}, 0),
        ) {
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
  }
  Future<void> addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    cartItems.update(event.product, (value) => value + 1, ifAbsent: () => 1);
    computePrice(event);
    emit(CartLoaded(
        cartItems.map((key, value) => MapEntry(key, value)), totalPrice));
  }

  Future<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    cartItems.update(event.product, (value) {
      if (value > 1) {
        return value - 1;
      }
      return 0;
    });
    cartItems.removeWhere((key, value) => value == 0);
    computePrice(event);
    emit(CartLoaded(
        cartItems.map((key, value) => MapEntry(key, value)), totalPrice));
  }

  void computePrice(CartEvent event) {
    if (event is AddToCartEvent) {
      totalPrice += event.product.priceATI;
    } else if (event is RemoveFromCartEvent) {
      totalPrice -= event.product.priceATI;
    }
  }
}
