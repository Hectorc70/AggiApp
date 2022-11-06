import 'package:flutter/material.dart';

class CardServiceTaxi extends StatelessWidget {
  final String description;
  final String nameService;
  final String image;
  final VoidCallback action;

  const CardServiceTaxi(
      {this.description, this.nameService, this.action, this.image, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: action,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        child: Column(
          children: [
            Container(
              width: widthScreen,
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        image,
                      ))),
            ),
            Container(
              child: Text(nameService),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Text(description))
          ],
        ),
      ),
    );
  }
}
