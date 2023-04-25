import 'package:digifood/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Panier'),
          leading: GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = state.cartItems.keys.toList()[index];
                      return ListTile(
                        title: Text(product.name,
                            style: Theme.of(context).textTheme.bodyLarge),
                        subtitle: Text(product.categories.first.toString()),
                        trailing: Text(
                            "${state.cartItems.values.toList()[index]} x ${product.priceATI.toInt()} €"),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 100,
                  color: Theme.of(context).cardColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Total : ${state.totalPrice}'),
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        }));
  }
}
