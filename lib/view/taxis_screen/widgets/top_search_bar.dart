import 'package:flutter/material.dart';

class TopBarSearchWidget extends StatelessWidget {
  const TopBarSearchWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
      height: 45.0,
      width: widthScreen * .95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromARGB(255, 240, 240, 240)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            width: widthScreen * .70,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Busca tu taxi favorito',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.search_rounded, color: Colors.black)
        ],
      ),
    );
  }
}
