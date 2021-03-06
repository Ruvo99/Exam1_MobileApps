import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/colors.dart';

class ItemDessertsDetails extends StatefulWidget {
  ProductCart cart;
  ProductDessert dessert;
  ItemDessertsDetails({
    Key key,
    @required this.cart,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  int style = 2;

  @override
  Widget build(BuildContext context) {
    // ProductCart cart = new ProductCart();
    // cart.drinks = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.dessert.productTitle}"),
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
                      "${widget.dessert.productImage}",
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
                          icon: widget.dessert.liked
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border_outlined),
                          onPressed: () {
                            setState(() {
                              widget.dessert.liked = !widget.dessert.liked;
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
                    "${widget.dessert.productTitle}",
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
                        "${widget.dessert.productDescription}",
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
                        "\$${style == 1 ? (widget.dessert.productPrice * 0.1).toStringAsFixed(2) : widget.dessert.productPrice}",
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
                      print(style);
                      setState(() {
                        style = 1;
                      });
                      print(style);
                    },
                    child: Text("Rebanada",
                        style: TextStyle(
                            color:
                                (style == 1) ? Colors.purple : cuppingBlack)),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (style == 1) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (style == 1) ? Colors.purple : cuppingGrey,
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
                        style = 2;
                      });
                    },
                    child: Text(
                      "Completo",
                      style: TextStyle(
                          color: (style == 2) ? Colors.purple : cuppingBlack),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (style == 2) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (style == 2) ? Colors.purple : cuppingGrey,
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
                          print(widget.cart.products);
                          widget.cart.products.add(ProductItemCart(
                              productLiked: widget.dessert.liked,
                              productTitle: widget.dessert.productTitle,
                              productAmount: 1,
                              productPrice: style == 1
                                  ? (widget.dessert.productPrice * 0.1)
                                  : widget.dessert.productPrice,
                              productImage: widget.dessert.productImage,
                              productPresentation:
                                  style == 1 ? 'Rebanada' : 'Completo',
                              productDescription:
                                  widget.dessert.productDescription));
                          print(widget.cart.products);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${widget.dessert.productTitle} agregado al carrito'),
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => Payment()));
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
