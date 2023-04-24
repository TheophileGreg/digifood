import 'package:bloc/bloc.dart';
import 'package:digifood/features/catalog/data/model/product.dart';
import 'package:digifood/features/catalog/data/repository/product_repository.dart';
import 'package:digifood/features/catalog/data/repository_impl/product_repository_impl.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductsLoadEvent>(loadProducts);
  }

  Future<void> loadProducts(
      ProductsLoadEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final products = await ProductRepositoryImpl().getProducts();
    emit(ProductLoaded(products));
  }
}
