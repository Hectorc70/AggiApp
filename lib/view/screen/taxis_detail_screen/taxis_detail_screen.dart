import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/cart_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/provider/cart_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/checkout_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/taxis_detail_screen/widgets/app_bar_detail_tax.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/taxis_detail_screen/widgets/card_taxi_widget.dart';
import 'package:provider/provider.dart';

class TaxiScreenDetail extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final double minAmount;
  final int index;
  const TaxiScreenDetail(
      {this.image, this.name, this.rating, this.index, this.minAmount, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [
          TopBarDetailTaxi(
            image: image,
            index: index,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
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
                width: 20.0,
              ),
              Container(
                width: widthScreen * .70,
                child: Text(name,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                      fontWeight: FontWeight.w700,
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Card(
            child: Container(
              width: widthScreen * .40,
              height: heightScreen * .05,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tarifa Minima',
                        style:
                            TextStyle(fontFamily: 'Ubuntu', color: Colors.grey),
                      ),
                      Icon(Icons.attach_money_rounded, color: Colors.grey)
                    ],
                  ),
                  Text(
                    '\$ ${minAmount.toString()}',
                    style: titilliumSemiBold,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              Text(
                'Servicios',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        CardServiceTaxi(
                          action: () {
                            CartModel cart = CartModel(
                                i,
                                i,
                                image,
                                'Servicio de Taxis - $i',
                                'seller',
                                minAmount,
                                minAmount,
                                minAmount.toInt(),
                                20,
                                '',
                                '',
                                Variation(
                                    price: minAmount,
                                    qty: 10,
                                    sku: i.toString(),
                                    type: ''),
                                0.0,
                                'e',
                                0.0,
                                ' widget.product.taxType',
                                1,
                                '',
                                i + 1,
                                '',
                                '',
                                '',
                                [],
                                [],
                                0,
                                1,
                                '1',
                                '1');
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(cart);
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 1000),
                                  pageBuilder: (context, anim1, anim2) =>
                                      CheckoutScreen(
                                    sellerId: index,
                                    onlyDigital: false,
                                    tax: 0.0,
                                    cartList: [],
                                    discount: 0.0,
                                    shippingFee: 0.0,
                                    totalOrderAmount: minAmount,
                                    fromProductDetails: true,
                                  ),
                                ));
                          },
                          description:
                              'It is a long established fact that a reader will be distracted by the readable cont The point of using',
                          image: 'assets/images/TEST/1.jpg',
                          nameService: 'Servicio de Taxis - $i',
                        ),
                        const SizedBox(
                          height: 10.0,
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
