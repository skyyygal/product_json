import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/product_model.dart';
import 'product_details.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      String jsonData = await rootBundle.loadString('assets/sample.json');
      List<dynamic> decodedJson = jsonDecode(jsonData);
      List<ProductModel> productList =
          decodedJson.map((json) => ProductModel.fromJson(json)).toList();

      setState(() {
        products = productList;
      });
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].productName.toString()),
            subtitle: Text('\$${products[index].price.toString()}'),
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.fromSize(
                  child: Image.network(
                    products[index].productImg!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                )),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
