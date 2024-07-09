import 'package:flutter/material.dart';
import 'package:shopping_cart/products.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'WELCOME',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25,),
                ),
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: 290, height: 60,
                  child: TextField(
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 204, 216, 216)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'User name',
                      labelStyle:
                          TextStyle(color: Colors.grey[600]),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 171, 53, 226),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 290, height: 60,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 204, 216, 216)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: 'Password',
                      labelStyle:
                          TextStyle(color: Colors.grey[600]),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 171, 53, 226),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Products()))
                  },
                  child: Text(
                    'Enter',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                      minimumSize: MaterialStateProperty.all<Size>(Size(160, 50)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 2, 2, 2)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color.fromARGB(255, 204, 216, 216))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}