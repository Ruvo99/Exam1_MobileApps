import 'package:flutter/material.dart';

import '../colors.dart';

class PayOption extends StatelessWidget {
  final String title;
  final String image;
  const PayOption({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Positioned.fill(
            top: 16,
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              color: cuppingGrey,
              child: Container(height: 180),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 80),
            width: 160,
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "$title",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Image.network(
                "$image",
                fit: BoxFit.contain,
                height: 180,
                width: 180,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
