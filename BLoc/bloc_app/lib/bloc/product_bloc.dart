// import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final Response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      emit(ProductSeccess(products: productFromJson(Response.body)));
    });
  }
}
