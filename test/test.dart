import 'package:bloc_test/bloc_test.dart';
import 'package:digifood/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartBloc', () {
    late CartBloc cartBloc;
    late Product product1;

    setUp(() {
      cartBloc = CartBloc();

      product1 = const Product(
          id: "1234",
          name: "Chips",
          imageURL: "https",
          description: "Les meilleurs chips",
          priceATI: 3,
          priceWT: 2,
          tva: 33,
          categories: [Categories.food, Categories.salt]);
    });

    test('Inital state is empty map and total == 0', () {
      expect(cartBloc.state, CartLoaded(const {}, 0));
    });

    blocTest(
      'emits CartLoaded when item is added',
      build: () => cartBloc,
      act: (bloc) => bloc.add(AddToCartEvent(product1)),
      expect: () => [
        CartLoading(),
        CartLoaded({product1: 1}, 3)
      ],
    );

    blocTest(
      'emits CartLoaded with the good map and totalPrice when 2 item is added',
      build: () => cartBloc,
      act: (bloc) => {
        bloc.add(AddToCartEvent(product1)),
        bloc.add(AddToCartEvent(product1))
      },
      skip: 3,
      expect: () => [
        CartLoaded({product1: 2}, 6)
      ],
    );

    blocTest(
      'emits CartLoaded empty map and totalPrice == 0 when item is removed',
      build: () => cartBloc,
      act: (bloc) => {
        bloc.add(AddToCartEvent(product1)),
        bloc.add(RemoveFromCartEvent(product1))
      },
      expect: () => [
        CartLoading(),
        CartLoaded({product1: 1}, 3),
        CartLoading(),
        CartLoaded({}, 0)
      ],
    );
  });
}
