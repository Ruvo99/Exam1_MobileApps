import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../colors.dart';

class ItemHotDrinks extends StatefulWidget {
  ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
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
                "Café",
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
                "${widget.drink.productTitle}",
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
                "\$${widget.drink.productPrice}",
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
                "${widget.drink.productImage}",
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
                    icon: widget.drink.liked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border_outlined),
                    onPressed: () {
                      setState(() {
                        widget.drink.liked = !widget.drink.liked;
                      });
                    })),
          ),
        ],
      ),
    );
  }
}
