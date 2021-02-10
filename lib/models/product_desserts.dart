import 'dart:math';

import 'package:flutter/foundation.dart';

enum ProductStyle { REBANADA, COMPLETO }

class ProductDessert {
  bool productLiked;
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductStyle productStyle; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  final bool liked;

  ProductDessert({
    @required this.productLiked,
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productStyle,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productStyle == ProductStyle.REBANADA)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productStyle == ProductStyle.COMPLETO)
      return (40 + Random().nextInt(60)).toDouble();
    return 9999.0;
  }
}
