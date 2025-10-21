import 'package:flutter/material.dart';
import 'package:flutter_test_types_implements/integration_folder/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> productList = ['Product 1', 'Product 2'];
  final productController = TextEditingController();

  void _addProduct(String productName) {
    setState(() {
      productList.add(productName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List', key: ValueKey('ProductListAppBarKey')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  key: ValueKey('Product $index'),
                  title: Text(productList[index]),
                  subtitle: Text(
                    'product index is ${productList.indexOf(productList[index])}',
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetails(productName: productList[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            key: ValueKey('MainAddProductBTN'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(10),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add Product'),
                        SizedBox(height: 15),
                        TextField(
                          key: ValueKey('ProductNameField'),
                          controller: productController,
                          decoration: InputDecoration(
                            hintText: 'Enter product name',
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          key: const ValueKey('dialogAddProductBTN'),
                          onPressed: () {
                            _addProduct(productController.text);
                            productController.clear();
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('Add New Product'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('add Product'),
          ),
        ],
      ),
    );
  }
}
