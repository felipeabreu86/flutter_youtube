import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class Config {
  static String _ambiente = kReleaseMode ? "RELEASE" : "DEBUG";
  static String get chaveYoutubeApi => _get('CHAVE_YOUTUBE_API_');
  static String get idCanal => _get('ID_CANAL_');
  static String get urlBase => _get('URL_BASE_');

  static String _get(String name) => dotenv.get(name + _ambiente, fallback: '');
}
