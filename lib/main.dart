import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_youtube/shared/config.dart';
import 'screens/home.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: Config.isDebugMode,
      home: Home(),
    ),
  );
}
