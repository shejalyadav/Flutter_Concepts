import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/model/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        flexibleSpace: Container(
          color: Color.fromARGB(255, 223, 211, 228),
          height: 100,
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              print(item);
              return ListTile(
                title: Text(item),
                trailing: Checkbox(
                  value: cartProvider.isCheckedList[index],
                  onChanged: (value) {
                    cartProvider.toggleChecked(index);
                  },
                ),
              );
            },
          );
        },
      ),
       bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ElevatedButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).removeFromCart();
          },
          child: Text('Remove from Cart'),
        ),
    ),);
  }
}