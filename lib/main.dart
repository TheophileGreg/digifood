import 'package:digifood/core/theme/app_theme.dart';
import 'package:digifood/features/catalog/presentation/bloc/product_bloc.dart';
import 'package:digifood/features/catalog/presentation/screen/catalog.dart';
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
    return BlocProvider(
        create: (context) => ProductBloc()..add(ProductsLoadEvent()),
        child: MaterialApp(
          title: 'FlutterFood',
          theme: lightTheme,
          home: const CatalogPage(),
        ));
  }
}
