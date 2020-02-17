import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  Biblioteca({Key key, this.query}) : super(key: key);
  final String query;
  @override
  _BibliotecaState createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Biblioteca",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
