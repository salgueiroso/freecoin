import 'package:flutter/material.dart';
import 'package:free_coin/models/usuario.dart';
import 'package:free_coin/page/admob.dart';
import 'package:free_coin/services/UsuarioService.dart';
import 'package:free_coin/widget/drawer.widget.dart';

class BaseLogadoPage extends StatefulWidget {
  final String titulo;

  BaseLogadoPage({Key key, this.titulo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BaseLogadoPageState();
}

class BaseLogadoPageState extends State<BaseLogadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.titulo ?? ""),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: AppDrawer(),
        body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Column(children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "SALDO CONQUISTADO",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: _generateEarnedSaldo()
//                  Text(
//                    '\$ 2.99',
//                    textAlign: TextAlign.left,
//                    style: TextStyle(color: Colors.green, fontSize: 30),
//                  )
                  ),
            ),

            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "DESAFIOS",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),

            _generateCard(_generateEarnButton())

//            _generateCard(_generateEarnButton()),
//            _generateCard(_generateEarnedContend())
          ]),
        ));
  }

  Widget _generateCard(Widget child) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: child,
      ),
    );
  }

  Widget _generateEarnButton() {
    return MaterialButton(
      child: Text(
        "Ganhar Moedas",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () => MontadorAnuncios.prepare(
          (type, amount) => print("Ganhou $type $amount")),
      padding: EdgeInsets.all(20.0),
      color: Colors.redAccent,
      colorBrightness: Brightness.dark,
      elevation: 2,
      shape: StadiumBorder(),
    );
  }

  Widget _generateEarnedSaldo() {
    return FutureBuilder<Usuario>(
      future: UsuarioService().obterUsuario(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return Text("\$${snapshot.data.saldo.toStringAsFixed(2)}",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.green, fontSize: 30));
        else if (snapshot.hasError) return Text("Tente novamente");

        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    MontadorAnuncios.bar();
  }
}
