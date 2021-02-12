import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  bool productLiked;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;
  String productImage;
  String productPresentation;
  String productDescription;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productLiked,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.productPresentation,
    @required this.productDescription,
  });
}
