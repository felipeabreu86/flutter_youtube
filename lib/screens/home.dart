import 'package:flutter/material.dart';
import 'package:flutter_youtube/screens/biblioteca.dart';
import 'package:flutter_youtube/screens/em_alta.dart';
import 'package:flutter_youtube/screens/inicio.dart';
import 'package:flutter_youtube/screens/inscricoes.dart';
import 'package:flutter_youtube/shared/customSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _pesquisa = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> _telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 140,
          height: 22,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(() {
                _pesquisa = res ?? "";
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Em Alta",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
