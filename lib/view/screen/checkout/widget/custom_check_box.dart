import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:provider/provider.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final int index;
  final VoidCallback onTap;
  final String image;

  CustomCheckBox(
      {@required this.title,
      @required this.index,
      @required this.image,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, order, child) {
        return InkWell(
          // onTap: onTap,
          child: Row(children: [
            Image.asset(
              image,
              width: 40.0,
              height: 20,
            ),
            Expanded(
              child: Text(title,
                  style: titilliumRegular.copyWith(
                    color: order.paymentMethodIndex == index
                        ? Theme.of(context).textTheme.bodyText1.color
                        : ColorResources.getGainsBoro(context),
                  )),
            ),
            Checkbox(
                shape: CircleBorder(),
                value: order.paymentMethodIndex == index,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool isChecked) {
                  order.setPaymentMethod(index);

                  onTap();
                }),
          ]),
        );
      },
    );
  }
}
