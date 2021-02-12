import 'package:estructura_practica_1/payment/pay_option.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../profile.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
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
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50),
          GestureDetector(
            onTap: _showAlert,
            child: PayOption(
              title: "Tarjeta de Crédito",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _showAlert,
            child: PayOption(
              title: "Paypal",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: _showAlert,
            child: PayOption(
              title: "Tarjeta de Regalo",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          )
        ],
      ),
    );
  }

  void _showAlert() {}
}
