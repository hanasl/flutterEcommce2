import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleGridView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2.8 / 3.4,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14),
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    return CustomItem();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: (() {}), icon: Icon(Icons.heat_pump_rounded))
              ],
            ),
            Container(
              height: 40,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.lightBlue),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              " Price 250",
              style: TextStyle(color: Colors.orange),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              " your describtion bla bla",
              style: TextStyle(color: Colors.orange),
            ),
            Divider(
              thickness: 1.4,
            ),
            TextButton(
                onPressed: (() {}),
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        ),

        // Text("your text"),
      ),
    );
  }
}
