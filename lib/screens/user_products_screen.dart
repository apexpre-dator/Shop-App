import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserProductItem(
                title: productsData.items[i].title,
                imageUrl: productsData.items[i].imageUrl,
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
