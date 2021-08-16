import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onepack/Components/side_menu.dart';


class ProductScreen extends StatefulWidget {


  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SideMenu(),
            ),
            Expanded(
              flex: 4,
              child: GridView.extent(
                childAspectRatio: (2 / 2),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                padding: EdgeInsets.all(10.0),
                maxCrossAxisExtent: 200.0,
                children: List.generate(50, (index) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: GridTile(
                        footer: Text(
                          'Item $index',
                          textAlign: TextAlign.center,
                          style:TextStyle(color:Colors.white,fontSize:15,fontWeight:FontWeight.bold),
                        ),

                        child: Icon(Icons.access_alarm,
                            size: 40.0, color: Colors.white),
                      ),
                    ),
                    color: RandomColorModel().getColor(),
                    margin: EdgeInsets.all(1.0),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}