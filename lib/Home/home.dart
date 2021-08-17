import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 140,
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
