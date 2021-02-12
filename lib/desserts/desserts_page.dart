import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/desserts/item_desserts.dart';
import '../profile.dart';
import 'item_desserts_details.dart';

class DessertsPage extends StatefulWidget {
  final List<ProductDessert> dessertsList;
  ProductCart cart;
  DessertsPage({
    Key key,
    @required this.dessertsList,
    @required this.cart,
  }) : super(key: key);

  @override
  _DessertsPageState createState() => _DessertsPageState();
}

class _DessertsPageState extends State<DessertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postres"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(productsList: widget.cart.products),
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
        itemCount: widget.dessertsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemDessertsDetails(cart: widget.cart),
                  settings:
                      RouteSettings(arguments: widget.dessertsList[index]),
                ),
              );
            },
            child: ItemDesserts(
              dessert: widget.dessertsList[index],
            ),
          );
        },
      ),
    );
  }
}
