import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';

class ItemDesserts extends StatefulWidget {
  final ProductDessert dessert;
  ItemDesserts({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsState createState() => _ItemDessertsState();
}

class _ItemDessertsState extends State<ItemDesserts> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("${widget.dessert.productTitle}"));
  }
}
