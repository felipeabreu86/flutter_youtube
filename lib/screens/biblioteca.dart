import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key}) : super(key: key);

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
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
