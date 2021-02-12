import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

import '../colors.dart';
import '../profile.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de compras"),
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Stack(children: [
          ListView.builder(
            itemCount: widget.productsList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 16.0),
                    child: Container(
                      height: 170.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [cuppingOrange, cuppingYellow],
                        ),
                      ),
                      child: Stack(fit: StackFit.loose, children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 40.0),
                          child: Image.network(
                            "${widget.productsList[index].productImage}",
                            fit: BoxFit.contain,
                            height: 100,
                            // width: 50.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 140.0, top: 15.0),
                          child: Text(
                            "${widget.productsList[index].productTitle}",
                            style: TextStyle(
                                color: cuppingBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 140.0, top: 45.0),
                          child: Text(
                            "${widget.productsList[index].productPresentation}",
                            style:
                                TextStyle(color: cuppingWhite, fontSize: 14.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 140.0, top: 65.0, right: 40.0),
                          child: Text(
                            "${widget.productsList[index].productDescription}",
                            style:
                                TextStyle(color: cuppingWhite, fontSize: 12.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 260.0, top: 100.0),
                          child: Text(
                            "\$${widget.productsList[index].productPrice}",
                            style: TextStyle(
                                color: cuppingBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 180.0, top: 105.0),
                          child: Text(
                            "${widget.productsList[index].productAmount}",
                            style: TextStyle(
                                color: cuppingBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 135.0, top: 90.0),
                            child: IconButton(
                              color: cuppingBlue,
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {},
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 185.0, top: 90.0),
                            child: IconButton(
                              color: cuppingBlue,
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () {},
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 299),
                          width: 180,
                          decoration: BoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: IconButton(
                                  icon: widget.productsList[index].productLiked
                                      ? Icon(Icons.favorite)
                                      : Icon(Icons.favorite_border_outlined),
                                  onPressed: () {
                                    setState(() {
                                      widget.productsList[index].productLiked =
                                          !widget
                                              .productsList[index].productLiked;
                                    });
                                  })),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 299, top: 65.0),
                          width: 180,
                          decoration: BoxDecoration(),
                          child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      widget.productsList.remove(widget.productsList[index]);
                                    });
                                  })),
                        ),
                      ]),
                    )),
              );
            },
          ),
        ]),
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
