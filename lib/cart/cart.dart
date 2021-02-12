import 'package:estructura_practica_1/payment/payment.dart';
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
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
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
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        widget.productsList[index].productImage,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.productsList[index].productTitle}",
                                          style: TextStyle(
                                              color: cuppingBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.productsList[index].productPresentation}",
                                          style: TextStyle(
                                              color: cuppingWhite,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${widget.productsList[index].productDescription}",
                                      style: TextStyle(
                                          color: cuppingWhite, fontSize: 12.0),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          color: cuppingBlue,
                                          icon: Icon(Icons.add_circle_outline),
                                          onPressed: () {
                                            setState(
                                              () {
                                                widget.productsList[index]
                                                    .productAmount += 1;
                                                _total += widget
                                                    .productsList[index]
                                                    .productPrice;
                                              },
                                            );
                                          },
                                        ),
                                        Text(
                                          "${widget.productsList[index].productAmount}",
                                          style: TextStyle(
                                              color: cuppingBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                        ),
                                        IconButton(
                                          color: cuppingBlue,
                                          icon:
                                              Icon(Icons.remove_circle_outline),
                                          onPressed: () {
                                            setState(
                                              () {
                                                widget.productsList[index]
                                                    .productAmount = widget
                                                            .productsList[index]
                                                            .productAmount ==
                                                        1
                                                    ? 1
                                                    : widget.productsList[index]
                                                            .productAmount -
                                                        1;
                                                _total -= widget
                                                    .productsList[index]
                                                    .productPrice;
                                              },
                                            );
                                          },
                                        ),
                                        Text(
                                          "\$${(widget.productsList[index].productPrice * widget.productsList[index].productAmount).toStringAsFixed(2)}",
                                          style: TextStyle(
                                              color: cuppingBlue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: widget.productsList[index]
                                                .productLiked
                                            ? Icon(Icons.favorite)
                                            : Icon(
                                                Icons.favorite_border_outlined),
                                        onPressed: () {
                                          setState(
                                            () {
                                              widget.productsList[index]
                                                      .productLiked =
                                                  !widget.productsList[index]
                                                      .productLiked;
                                            },
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          print('hola');
                                          setState(
                                            () {
                                              _total -= (widget
                                                      .productsList[index]
                                                      .productPrice *
                                                  widget.productsList[index]
                                                      .productAmount);
                                              widget.productsList.remove(
                                                  widget.productsList[index]);
                                            },
                                          );
                                        },
                                      ),
                                    ],
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
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Total',
                          style: TextStyle(
                            color: cuppingBlack,
                            fontSize: 24.0,
                          ),
                        ),
                        TextSpan(
                          text: '\n\$${_total.toStringAsFixed(2)}',
                          style: TextStyle(color: cuppingBlack, fontSize: 24.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 90.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Payment()));
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: cuppingGrey,
                    ),
                    child: Text(
                      'PAGAR',
                      style: TextStyle(color: cuppingBlack),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // void _priceUpdate(double newItemPrice) {
  //   setState(() {
  //     _total += newItemPrice;
  //   });
  // }
}
