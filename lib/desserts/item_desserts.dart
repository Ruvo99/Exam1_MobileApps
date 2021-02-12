import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';

import '../colors.dart';

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
    return Container(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(24.0),
              color: cuppingGrey,
              child: Container(height: 180),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 30),
            width: 160,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Postre",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 70),
            width: 180,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "${widget.dessert.productTitle}",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cuppingWhite,
                    fontSize: 22.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 120),
            width: 180,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "\$${widget.dessert.productPrice}",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cuppingBlack,
                    fontSize: 29.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170.0, top: 50, bottom: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "${widget.dessert.productImage}",
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 299, top: 12),
            width: 180,
            decoration: BoxDecoration(),
            child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: IconButton(
                    icon: widget.dessert.liked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      setState(() {
                        widget.dessert.liked = !widget.dessert.liked;
                      });
                    })),
          ),
        ],
      ),
    );
  }
}
