import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/payment/pay_option.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';

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
              image:
                  "https://i.pinimg.com/originals/f9/b8/65/f9b8656657dd39621061fee4a48f088e.png",
            ),
          ),
          GestureDetector(
            onTap: _showAlert,
            child: PayOption(
              title: "Paypal",
              image:
                  "https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-2.png",
            ),
          ),
          GestureDetector(
            onTap: _showAlert,
            child: PayOption(
              title: "Tarjeta de Regalo",
              image:
                  "https://www.tinpin.com/wp-content/uploads/2019/12/icon_giftcard_square.png",
            ),
          )
        ],
      ),
    );
  }

  void _showAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Image.network(
                'https://img.freepik.com/foto-gratis/arreglo-granos-cafe-tostados-taza-blanca_23-2148441237.jpg?size=626&ext=jpg'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.shopping_bag_outlined),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '!Orden Exitosa!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text('Gracias por tu compra.'),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          'To orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.'),
                    )
                  ],
                )
              ],
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Home(title: APP_TITLE),
                    ),
                  );
                  ;
                },
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          );
        });
  }
}
