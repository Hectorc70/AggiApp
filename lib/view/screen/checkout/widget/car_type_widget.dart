import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/credit_card_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:provider/provider.dart';

class CardTypeWidget extends StatelessWidget {
  final String number;
  final int index;
  final VoidCallback onTap;
  final String type;
  final String id;

  CardTypeWidget(
      {@required this.number,
      @required this.index,
      @required this.id,
      @required this.type,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCreditCardProvider>(
      builder: (context, order, child) {
        switch (type) {
          case 'mastercard':
            return ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: Image.asset(
                'assets/images/mastercard.png',
                width: 60.0,
                height: 30,
              ),
              title: Text(
                number,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Checkbox(
                shape: CircleBorder(),
                value: true,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool isChecked) {},
              ),
            );

          case 'visa':
            return ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: Image.asset(
                'assets/images/visa.png',
                width: 60.0,
                height: 30,
              ),
              title: Text(
                number,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Checkbox(
                shape: CircleBorder(),
                value: true,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool isChecked) {},
              ),
            );
          case 'american_express':
            return ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: Image.asset(
                'assets/images/mastercard.png',
                width: 60.0,
                height: 30,
              ),
              title: Text(
                number,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Checkbox(
                shape: CircleBorder(),
                value: false,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool isChecked) {},
              ),
            );
          default:
            return ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: Image.asset(
                'assets/images/visa.png',
                width: 60.0,
                height: 30,
              ),
              title: Text(
                number,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: Checkbox(
                shape: CircleBorder(),
                value: false,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool isChecked) {},
              ),
            );
        }
      },
    );
  }
}
