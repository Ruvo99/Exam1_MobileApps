import 'package:estructura_practica_1/models/product_cart.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/colors.dart';

class ItemGrainsDetails extends StatefulWidget {
  ProductCart cart;
  ProductGrains grain;
  ItemGrainsDetails({
    Key key,
    @required this.cart,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  double amount = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.grain.productTitle}"),
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
                      "${widget.grain.productImage}",
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
                        icon: widget.grain.liked
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                        onPressed: () {
                          setState(
                            () {
                              widget.grain.liked = !widget.grain.liked;
                            },
                          );
                        },
                      ),
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
                    "${widget.grain.productTitle}",
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
                        "${widget.grain.productDescription}",
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
                        "\$${amount == 1 ? (widget.grain.productPrice * 0.25).toStringAsFixed(2) : widget.grain.productPrice}",
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
                      print(amount);
                      setState(() {
                        amount = 1;
                      });
                      print(amount);
                    },
                    child: Text("250 g",
                        style: TextStyle(
                            color:
                                (amount == 1) ? Colors.purple : cuppingBlack)),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (amount == 1) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (amount == 1) ? Colors.purple : cuppingGrey,
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
                        amount = 2;
                      });
                    },
                    child: Text(
                      "1 k",
                      style: TextStyle(
                          color: (amount == 2) ? Colors.purple : cuppingBlack),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor:
                          (amount == 2) ? Colors.purple[100] : cuppingWhite,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: (amount == 2) ? Colors.purple : cuppingGrey,
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
                              productLiked: widget.grain.liked,
                              productTitle: widget.grain.productTitle,
                              productAmount: 1,
                              productPrice: amount == 1
                                  ? (widget.grain.productPrice * 0.25)
                                  : widget.grain.productPrice,
                              productImage: widget.grain.productImage,
                              productPresentation:
                                  amount == 1 ? '250 g' : '1 k',
                              productDescription:
                                  widget.grain.productDescription));
                          print(widget.cart.products);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${widget.grain.productTitle} agregado al carrito'),
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
