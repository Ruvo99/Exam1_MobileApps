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
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        color: cuppingGrey,
        child: Container(
            height: 180,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          "$image",
                          height: 110,
                          width: 110,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "$title",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.mode_edit),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
