import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';

class CardProductLarge extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final double minAmount;
  final VoidCallback action;
  final int index;

  const CardProductLarge(
      {this.image,
      this.name,
      this.action,
      this.rating,
      this.minAmount,
      this.index,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: action,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        child: Container(
          child: Column(
            children: [
              Hero(
                tag: index,
                child: Container(
                  width: widthScreen,
                  height: 170.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                image,
                              ))),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Container(
                        width: widthScreen * .65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: titleRegular,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text('Tar. Min.\$ $minAmount')
                          ],
                        )),
                    Container(
                      height: 25.0,
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(255, 255, 246, 166)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            color: Color.fromARGB(255, 255, 172, 18),
                          ),
                          Text(rating.toString(), style: titilliumBold)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
