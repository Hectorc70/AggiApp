import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/credit_card_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/credit_card_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddCreditCardProvider(), child: _Body());
  }
}

class _Body extends StatefulWidget {
  const _Body({Key key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  OutlineInputBorder border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(title: getTranslated('add_credit_card', context)),
        CreditCardWidget(
          cardBgColor: Theme.of(context).primaryColor,
          labelCardHolder: '',
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          isHolderNameVisible: true,
          isSwipeGestureEnabled: true,
          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Theme.of(context).highlightColor,
                textColor: Theme.of(context).colorScheme.primary,
                cardNumberDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                  isDense: true,
                  hintText: getTranslated('number_card', context),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintStyle: titilliumRegular.copyWith(
                      color: Theme.of(context).hintColor),
                  errorStyle: TextStyle(height: 1.5),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
                expiryDateDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                  isDense: true,
                  hintText: getTranslated('date_exp', context),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintStyle: titilliumRegular.copyWith(
                      color: Theme.of(context).hintColor),
                  errorStyle: TextStyle(height: 1.5),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
                cvvCodeDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                  isDense: true,
                  hintText: 'CVV',
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintStyle: titilliumRegular.copyWith(
                      color: Theme.of(context).hintColor),
                  errorStyle: TextStyle(height: 1.5),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
                cardHolderDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                  isDense: true,
                  hintText: getTranslated('holder_name', context),
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  hintStyle: titilliumRegular.copyWith(
                      color: Theme.of(context).hintColor),
                  errorStyle: TextStyle(height: 1.5),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Provider.of<AddCreditCardProvider>(context).isLoader
          ? Container(
              height: 50,
              width: 30,
              padding: const EdgeInsets.only(bottom: 10.0),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
            )
          : CustomButton(
              buttonText: getTranslated('accept', context),
              onTap: () async {
                if (formKey.currentState.validate()) {
                  CreditCardModelCustom model = CreditCardModelCustom(
                      cardNumber: cardNumber.replaceAll(' ', ''),
                      expirationMonth: expiryDate.split('/')[0],
                      expirationYear: expiryDate.split('/')[1],
                      holderName: cardHolderName,
                      cvv: cvvCode);
                  Provider.of<AddCreditCardProvider>(context, listen: false)
                      .modelCard = model;
                  final rsponse = await Provider.of<AddCreditCardProvider>(context,
                          listen: false)
                      .payOrder();
                }
              },
              isBuy: false),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
