import 'package:digifood/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:digifood/features/catalog/presentation/bloc/product_bloc.dart';
import 'package:digifood/features/catalog/presentation/screen/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterFood'),
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.products.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductCard(product: product);
                  // ListTile(
                  //   title: Text(product.name),
                  //   subtitle: Text(product.categories.first.toString()),
                  //   trailing: Text(product.priceATI.toString()),
                  //   leading: GestureDetector(
                  //     onTap: () => BlocProvider.of<CartBloc>(context)
                  //         .add(AddToCartEvent(product)),
                  //     child: const Icon(Icons.add),
                  //   ),
                  // );
                },
              );
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/cart');
        },
        tooltip: 'cart',
        child: const Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;
  }
}
