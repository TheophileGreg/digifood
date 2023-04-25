import 'package:cached_network_image/cached_network_image.dart';
import 'package:digifood/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (BuildContext cartContext, CartState cartState) {
      if (cartState is CartLoaded) {
        // final productInCart = cartState.cartItems.
        //         .where((element) => element.product.id == product.id)
        //         .isNotEmpty;

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                    progressIndicatorBuilder:
                        (context, string, downloadProgress) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                        ),
                      );
                    },
                    imageUrl: product.imageURL,
                  ),
                ),
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.displayMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.priceATI}€',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Row(children: [
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(RemoveFromCartEvent(product));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 7, bottom: 7, right: 7, left: 7),
                          height: 25,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        )),
                    //Display le nombre de produit dans le panier
                    // Text(productWithNb.nbInCart.toString()),
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(AddToCartEvent(product));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 7, bottom: 7, right: 5, left: 7),
                          height: 25,
                          // decoration: BoxDecoration(
                          //     color: productWithNb.inStock &&
                          //             productWithNb.nbInCart <
                          //                 productWithNb.product.stock
                          //         ? Theme.of(context).primaryColor
                          //         : Colors.grey,
                          // shape: BoxShape.circle),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                  ])
                ],
              ),
            ],
          ),
        );
      }
      ;
      return Container();
    });
  }
}
