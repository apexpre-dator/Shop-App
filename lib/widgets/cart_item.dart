import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id, title;
  final double price;
  final int quantity;

  CartItem(this.id, this.title, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${price * quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
