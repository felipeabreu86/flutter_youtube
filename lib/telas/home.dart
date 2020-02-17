import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/customs/CustomSearchDelegate.dart';
import 'package:flutter_youtube_app/telas/biblioteca.dart';
import 'package:flutter_youtube_app/telas/emAlta.dart';
import 'package:flutter_youtube_app/telas/inicio.dart';
import 'package:flutter_youtube_app/telas/inscricoes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _query = "";

  @override
  Widget build(BuildContext context) {
    _navegacao(int tela) {
      String pesquisa = _query;
      _query = "";
      switch (0) {
        case 0:
          return Inicio(query: pesquisa);
          break;
        case 1:
          return EmAlta(query: pesquisa);
          break;
        case 2:
          return Inscricoes(query: pesquisa);
          break;
        case 3:
          return Biblioteca(query: pesquisa);
          break;
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          height: 22,
          width: 98,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: this.context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: _navegacao(_indiceAtual),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Inicio"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Em Alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
