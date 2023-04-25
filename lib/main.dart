import 'package:digifood/core/navigation/routes.dart';
import 'package:digifood/core/theme/app_theme.dart';
import 'package:digifood/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:digifood/features/catalog/data/repository_impl/product_repository_impl.dart';
import 'package:digifood/features/catalog/presentation/bloc/product_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (BuildContext context) =>
                ProductBloc(ProductRepositoryImpl())..add(ProductsLoadEvent()),
          ),
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(),
          ),
        ],
        child: MaterialApp.router(
          title: 'FlutterFood',
          theme: lightTheme,
          routerConfig: router,
        ));
  }
}
