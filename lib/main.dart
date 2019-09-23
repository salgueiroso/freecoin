import 'package:flutter/material.dart';
import 'package:free_coin/page/admob.dart';
import 'package:free_coin/page/logado.page.dart';

void main() {
  MontadorAnuncios.inicializar();
  runApp(FreeCoinApp());
}

class FreeCoinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Earn CryptoCoins free',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => new BaseLogadoPage(
                titulo: "Free CryptoCoins",
              ),
          '/reward': null
        });
  }
}
