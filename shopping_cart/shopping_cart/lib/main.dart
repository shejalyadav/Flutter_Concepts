import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/login.dart';
import 'package:shopping_cart/model/cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: login(),
      ),
    );
  }
}