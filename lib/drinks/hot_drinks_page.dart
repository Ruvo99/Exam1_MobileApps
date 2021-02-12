import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../profile.dart';
import 'item_hot_drinks_details.dart';

class HotDrinksPage extends StatefulWidget {
  List<ProductHotDrinks> drinksList;
  ProductCart cart;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.cart,
  }) : super(key: key);

  @override
  _HotDrinksPageState createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
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
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                builder: (context) => ItemHotDrinksDetails(
                    cart: widget.cart, drink: widget.drinksList[index]),
              ))
                  .then((response) {
                setState(() {});
              });
            },
            child: ItemHotDrinks(
              drink: widget.drinksList[index],
            ),
          );
        },
      ),
    );
  }
}
