import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  ItemHotDrinksDetails({Key key}) : super(key: key);

  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  int cupSize = 3;

  @override
  Widget build(BuildContext context) {
    ProductHotDrinks hotDrink = ModalRoute.of(context).settings.arguments;
    ProductCart cart = new ProductCart();
    cart.drinks = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("${hotDrink.productTitle}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48.0,
              ),
              Stack(
                fit: StackFit.loose,
                children: [
                  Center(
                    child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [cuppingOrange, cuppingYellow],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.0,
                    left: 100.0,
                    child: Image.network(
                      "${hotDrink.productImage}",
                      fit: BoxFit.contain,
                      height: 200,
                      width: 200,
                    ),
                    // ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      // margin: EdgeInsets.only(left: 250),
                      width: 180,
                      decoration: BoxDecoration(),
                      child: IconButton(
                          icon: hotDrink.liked
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                          onPressed: () {
                            setState(() {
                              hotDrink.liked = !hotDrink.liked;
                            });
                          }),
                    ),
                  )
                ],
                clipBehavior: Clip.hardEdge,
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Text(
                    "${hotDrink.productTitle}",
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        "${hotDrink.productDescription}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        "TAMAÑOS DISPONIBLES",
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        "\$${cupSize == 3 ? hotDrink.productPrice : cupSize == 2 ? hotDrink.productPrice * 0.7 : hotDrink.productPrice * 0.5}",
                        style: TextStyle(fontSize: 28.0),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      print(cupSize);
                      setState(() {
                        cupSize = 1;
                      });
                      print(cupSize);
                    },
                    child: Text("Chico",
                        style: TextStyle(
                            color:
                                (cupSize == 1) ? Colors.purple : cuppingBlack)),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (cupSize == 1) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (cupSize == 1) ? Colors.purple : cuppingGrey,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        cupSize = 2;
                      });
                    },
                    child: Text(
                      "Mediano",
                      style: TextStyle(
                          color: (cupSize == 2) ? Colors.purple : cuppingBlack),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (cupSize == 2) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (cupSize == 2) ? Colors.purple : cuppingGrey,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        cupSize = 3;
                      });
                    },
                    child: Text(
                      "Grande",
                      style: TextStyle(
                          color: (cupSize == 3) ? Colors.purple : cuppingBlack),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (cupSize == 3) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (cupSize == 3) ? Colors.purple : cuppingGrey,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: cuppingGrey,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(hotDrink);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${hotDrink.productTitle} agregado al carrito'),
                              backgroundColor: cuppingBlue,
                            ),
                          );
                        },
                        child: Text(
                          "AGREGAR AL CARRITO",
                          style: TextStyle(color: cuppingBlack),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: cuppingGrey,
                        ),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => Home(title: APP_TITLE)));
                        },
                        child: Text(
                          "COMPRAR AHORA",
                          style: TextStyle(color: cuppingBlack),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
