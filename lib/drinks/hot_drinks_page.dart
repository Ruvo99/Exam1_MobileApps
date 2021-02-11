import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../profile.dart';
import 'item_hot_drinks_details.dart';

class HotDrinksPage extends StatefulWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  _HotDrinksPageState createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
  var test = List<ProductHotDrinks>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.of(context).pop(test);
              // if (test != null) {
              //   print("hot drinks page hay algo");
              //   print(test);
              //
              // } else {
              //   print("no hay algoo");
              //   Navigator.of(context).pop();
              // }
            }),
        title: Text("Bebidas"),
        centerTitle: true,
        actions: <Widget>[
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
                builder: (context) => ItemHotDrinksDetails(),
                settings: RouteSettings(arguments: widget.drinksList[index]),
              ))
                  .then((selection) {
                if (selection != null) {
                  print(selection.productTitle);
                  test.add(selection);
                  print(test);
                }
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
