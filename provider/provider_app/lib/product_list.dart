import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/product.dart';
import 'package:provider_app/provider/product_provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    if (productData.productList.isEmpty) {
      productData.fetchData();
    }
    return ListView.builder(
      itemCount: productData.productList.length,
      itemBuilder: (BuildContext context, int index) => ContainerCard(
        imageUrl: productData.productList[index].image,
        title: productData.productList[index].title,
        category: productData.productList[index].category,
        price: '\$' + productData.productList[index].price.toString(),
      ),
    );
  }
}

class ContainerCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String price;

  ContainerCard({
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(width: 16.0),
          // Title, Description, and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 8.0),
                Text(
                  category,
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
                SizedBox(height: 8.0),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
