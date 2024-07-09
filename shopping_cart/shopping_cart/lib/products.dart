import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart.dart';
import 'package:shopping_cart/model/cart_provider.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 223, 211, 228)),
                ),
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.deepPurple,
                  size: 24,
                ),
              ),
              SizedBox(width: 20),
              Center(
                child: Text(
                  'Catalog',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 223, 211, 228)),
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart())),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.deepPurple,
                  size: 24,
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 204, 216, 216)),
          flexibleSpace: Container(
            color: Color.fromARGB(255, 223, 211, 228),
            height: 100,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Column(
                  children: [
                    ProductItem(img: 'https://img.freepik.com/premium-vector/fruits-illustration-01_921799-7.jpg', prod: 'Fruits'),
                    ProductItem(
                      img : 'https://4.imimg.com/data4/AY/TE/IMOB-27708947/c__data_users_defapps_appdata_internetexplorer_temp_sav.jpg',
                      prod: 'Vegetables',
                    ),
                    ProductItem(img:'https://t3.ftcdn.net/jpg/00/85/71/68/360_F_85716836_UtqykRKQ7Fiyn3IIH7cqd9Jn3NHxC1MW.jpg' ,prod: 'Eggs'),
                    ProductItem(
                      img: 'https://media.istockphoto.com/id/1371529706/vector/milk-paper-pack-glass-milk-carton.jpg?s=612x612&w=0&k=20&c=eIgDfic4-R836n5Nt8govY0EIa1D2b1QZNrmEJnRbzg=',
                      prod: 'Milk',
                    ),
                    ProductItem(img:'https://c8.alamy.com/comp/2G7MC2Y/raw-and-sprouted-mung-beans-hand-drawn-watercolor-illustration-isolated-on-white-background-2G7MC2Y.jpg', prod: 'Sprouts'),
                    ProductItem(img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFP2rmM3iNLOZwjwSWu1v6xEkji-3B7AgFTh3rf2Bv3A&s', prod: 'IceCream'),
                    ProductItem(img: 'https://i.pinimg.com/736x/a4/97/92/a497926f75a435f27307276ae7d31c8e.jpg', prod: 'Spaghetti'),
                    ProductItem(img:'https://thumbs.dreamstime.com/z/vector-burger-sketch-isolated-illustration-hand-drawn-white-background-tasty-fresh-fastfood-chickenburger-cheesburger-98431681.jpg', prod: 'Burger'),
                    ProductItem(img:'https://static.vecteezy.com/system/resources/previews/000/427/685/non_2x/vector-cup-with-nuts.jpg', prod: 'Nuts'),
                  ],
                );
              },
            )),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String img;
  final String prod;

  const ProductItem({required this.img, required this.prod});
  @override
  Widget build(BuildContext context) {
    String text = 'Add to cart';
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage(img), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            '$prod',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 20),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              cartProvider.addToCart(prod);
              print(prod);
            },
            child: Text('$text'),
          ),
        ],
      ),
    );
  }
}