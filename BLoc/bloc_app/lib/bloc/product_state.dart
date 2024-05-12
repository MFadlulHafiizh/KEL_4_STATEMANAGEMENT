part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSeccess extends ProductState {
  final List<Product> products;

  ProductSeccess({required this.products});
}
