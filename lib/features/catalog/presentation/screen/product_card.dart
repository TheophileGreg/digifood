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
        return Container(
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
                        baseColor: Theme.of(context).cardColor,
                        highlightColor: Theme.of(context).highlightColor,
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.white,
                            )),
                      );
                    },
                    imageUrl: product.imageURL,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${product.priceATI}€',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Row(children: [
                          isProductInCart(cartState)
                              ? GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    BlocProvider.of<CartBloc>(context)
                                        .add(RemoveFromCartEvent(product));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(7),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ))
                              : Container(),
                          isProductInCart(cartState)
                              ? Text(getNumberProductInCart(cartState))
                              : Container(),
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                BlocProvider.of<CartBloc>(context)
                                    .add(AddToCartEvent(product));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(7),
                                height: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
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
              )
            ],
          ),
        );
      }
      ;
      return Container();
    });
  }

  String getNumberProductInCart(CartLoaded cartState) {
    if (cartState.cartItems[product] != null) {
      return cartState.cartItems[product]!.toString();
    } else {
      return '0';
    }
  }

  bool isProductInCart(CartLoaded cartState) {
    return cartState.cartItems[product] != null &&
        cartState.cartItems[product]! > 0;
  }
}
