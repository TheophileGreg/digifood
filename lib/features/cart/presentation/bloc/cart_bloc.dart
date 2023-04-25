import 'package:bloc/bloc.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  Map<Product, int> cartItems = {};
  CartBloc()
      : super(
          CartLoaded(const {}),
        ) {
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
  }
  Future<void> addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    cartItems.update(event.product, (value) => value + 1, ifAbsent: () => 1);
    emit(CartLoaded(cartItems));
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
    emit(CartLoaded(cartItems));
  }

  // void removeProduct(RemoveFromCartEvent event) {
  //   cartItems.remove(event.product);
  // }
}
