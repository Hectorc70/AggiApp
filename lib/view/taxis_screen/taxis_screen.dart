import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/taxis_detail_screen/taxis_detail_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/taxis_screen/widgets/card_product_large.dart';
import 'package:flutter_sixvalley_ecommerce/view/taxis_screen/widgets/top_search_bar.dart';

class TaxisScreen extends StatelessWidget {
  const TaxisScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [
          CustomAppBar(title: 'Aggi Taxi'),
          TopBarSearchWidget(),
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: 10,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        CardProductLarge(
                          index: i,
                          action: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 1000),
                                  pageBuilder: (context, anim1, anim2) =>
                                      TaxiScreenDetail(
                                    image: 'assets/images/TEST/2.jpg',
                                    minAmount: 30.0,
                                    rating: 4.4,
                                    name: 'Aggi central de Taxis -  $i',
                                    index:i
                                  ),
                                ));
                          },
                          rating: 4.4,
                          minAmount: 30.0,
                          name: 'Aggi central de Taxis -  $i',
                          image: 'assets/images/TEST/2.jpg',
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
