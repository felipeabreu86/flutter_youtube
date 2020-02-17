import 'package:flutter_youtube_app/service/httpService.dart';
import 'dart:convert';
import '../model/video.dart';

const CHAVE_YOUTUBE_API = ""; // Inserir chave valida para API do Youtube
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  void pesquisar(String pesquisa) async {
    var url = URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa";

    var resposta = await HttpService.httpGet(url);

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(resposta.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromMap(map);
      }).toList();

      for (var video in videos) {
        print(video.titulo);
      }
    } else {
      print("erro");
    }
  }
}
