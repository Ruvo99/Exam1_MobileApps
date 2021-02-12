import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';

import 'package:estructura_practica_1/models/product_cart.dart';

import '../profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ProductCart cart =
      new ProductCart(products: List<ProductItemCart>.empty(growable: true));
  List<ProductHotDrinks> drinksList =
      ProductRepository.loadProducts(ProductType.BEBIDAS);
  List<ProductDessert> dessertList =
      ProductRepository.loadProducts(ProductType.POSTRES);
  List<ProductGrains> grainsList =
      ProductRepository.loadProducts(ProductType.GRANO);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(productsList: cart.products),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Profile(),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _showSnackbar,
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HotDrinksPage(drinksList: drinksList, cart: cart),
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GrainsPage(grainsList: grainsList, cart: cart),
      ),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            DessertsPage(dessertsList: dessertList, cart: cart),
      ),
    );
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Proximamente'),
        backgroundColor: cuppingBlue,
      ),
    );
  }
}
