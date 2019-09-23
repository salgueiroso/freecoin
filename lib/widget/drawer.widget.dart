import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icone: Icons.account_balance,
              texto: "Ganhar",
              onTap: () => Navigator.pushReplacementNamed(context, "/reward")),
          Divider()
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icone, String texto, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icone),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(texto),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.amber,
//          image: DecorationImage(
//              fit: BoxFit.cover,
//              image: NetworkImage(
//                  "https://conteudo.imguol.com.br/blogs/275/files/2019/02/damares-1024x682.jpg"))
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "FreeCoin",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
