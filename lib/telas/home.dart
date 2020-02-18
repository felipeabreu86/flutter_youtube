import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/blocs/home_bloc.dart';
import 'package:flutter_youtube_app/customs/CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  final HomeBloc bloc = HomeBloc();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print("Buildou !!!!!!!!!!!!");
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
      body: StreamBuilder<Widget>(
        stream: widget.bloc.telaStream,
        initialData: widget.bloc.recuperarTelaInicial(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Erro ao carregar a tela!');
          } else {
            return snapshot.data;
          }
        },
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: widget.bloc.bottomNavigationStream,
        initialData: 0,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            currentIndex: widget.bloc.indexTela,
            onTap: (index) {
              widget.bloc.atualizarIndex(index);
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
          );
        },
      ),
    );
  }
}
