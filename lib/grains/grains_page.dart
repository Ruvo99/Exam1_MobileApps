import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import '../profile.dart';

class GrainsPage extends StatefulWidget {
  List<ProductGrains> grainsList;
  ProductCart cart;
  GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.cart,
  }) : super(key: key);

  @override
  _GrainsPageState createState() => _GrainsPageState();
}

class _GrainsPageState extends State<GrainsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Cart(productsList: widget.cart.products),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => ItemGrainsDetails(
                      cart: widget.cart, grain: widget.grainsList[index]),
                ),
              )
                  .then((response) {
                setState(() {});
              });
            },
            child: ItemGrains(
              grain: widget.grainsList[index],
            ),
          );
        },
      ),
    );
  }
}
