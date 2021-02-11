import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/item_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import '../profile.dart';

class GrainsPage extends StatefulWidget {
  final List<ProductGrains> grainsList;
  GrainsPage({
    Key key,
    @required this.grainsList,
  }) : super(key: key);

  @override
  _GrainsPageState createState() => _GrainsPageState();
}

class _GrainsPageState extends State<GrainsPage> {
  var grainsCartList = List<ProductGrains>.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Granos"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop(grainsCartList);
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                // TODO: Eliminar este boton y adaptar todo el contenido de la pagina de perfil en un Drawer aqui en la pantalla Home
                MaterialPageRoute(
                  builder: (_) => Profile(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => ItemGrainsDetails(),
                  settings: RouteSettings(arguments: widget.grainsList[index]),
                ),
              )
                  .then(
                (selection) {
                  print(selection);
                  grainsCartList.add(selection);
                  print(grainsCartList);
                },
              );
            },
            child: ItemGrains(
              grain: widget.grainsList[index],
            ),
          );
        },
      ),
    );
  }
}
