import 'package:flutter/material.dart';

class TopBarDetailTaxi extends StatelessWidget {
  final String image;
  final int index;

  const TopBarDetailTaxi({this.image, this.index, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Hero(
          tag: index,
          child: Container(
            width: widthScreen,
            height: height * .26,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ))),
          ),
        ),
        Positioned(
            top: 40.0,
            left: 20.0,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).highlightColor),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 25.0,
                  )),
            ))
      ],
    );
  }
}
