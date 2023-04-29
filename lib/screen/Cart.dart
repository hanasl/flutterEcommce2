import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constance.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   List<String> names = <String>['hana', 'hana', 'hana', 'hana', 'hana'];
  List<String> images = <String>[
    'asset/montre.jpg',
    'asset/montre.jpg',
    'asset/montre.jpg',
    'asset/montre.jpg',
    'asset/montre.jpg'
  ];
  List<int> price = <int>[123, 123, 123, 147, 159];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Column(
        children: [
          Expanded(
            child: Container(
                child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 110,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              names[index],
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              '\$ ${price[index].toString()}',
                              style: TextStyle(color: primaryColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 100,
                                color: Colors.grey.shade200,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(
                                        Icons.minimize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: names.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$ 2000',
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    )
                  ],
                ),
                Container(
                  height: 80,
                  width: 180,
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(10),
                    color: primaryColor,
                    onPressed: () {},
                    child: Text(
                      'CHECKOUT',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
    
  }
}
