import 'package:flutter/material.dart';

class ScreenLoaderWidget extends StatelessWidget {
  final int status;
  const ScreenLoaderWidget({@required this.status, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Procesando Pago...'),
              const SizedBox(
                height: 10.0,
              ),
              Text('Espere un momento...esto puede tardar unos minutos'),
              const SizedBox(
                height: 20.0,
              ),
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Procesando Pago...'),
            const SizedBox(
              height: 10.0,
            ),
            Text('Espere un momento...esto puede tardar unos minutos')
          ],
        ),
      ),
    );
  }
}
