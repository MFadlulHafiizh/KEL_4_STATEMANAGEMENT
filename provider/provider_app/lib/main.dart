import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/product_list.dart';
import 'package:provider_app/provider/product_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => ProductProvider()))
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProductList());
  }
}
