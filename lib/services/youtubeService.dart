import 'package:flutter_youtube_app/services/httpService.dart';
import 'dart:convert';
import '../model/video.dart';
import 'package:http/http.dart' as http;

const URL_BASE = "https://www.googleapis.com/youtube/v3/";
// !Inserir chave valida para API do Youtube
const CHAVE_YOUTUBE_API = ""; 

class YoutubeService {
  static Future<List<Video>> pesquisar(String pesquisa) async {
    var url = URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&q=$pesquisa";

    http.Response resposta;
    List<Video> videos = new List<Video>();

    try {
      resposta = await HttpService.httpGet(url);
    } catch (e) {
      print("YoutubeService Erro: $e");
      throw e;
    }

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(resposta.body);
      videos = dadosJson["items"].map<Video>((map) {
        return Video.fromMap(map);
      }).toList();
    } else {
      print("YoutubeService Statuscode: ${resposta.statusCode}");
    }

    return videos;
  }
}
