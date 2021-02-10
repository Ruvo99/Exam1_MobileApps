import 'package:estructura_practica_1/models/product_desserts.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class ProductCart {
  List<ProductHotDrinks> drinks;
  List<ProductGrains> grains;
  List<ProductDessert> desserts;

  ProductCart({
    this.drinks,
    this.grains,
    this.desserts,
  });
}
