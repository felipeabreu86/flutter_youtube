import 'package:flutter_youtube/model/video.dart';
import 'package:flutter_youtube/shared/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    List<Video> videos = [];
    http.Response response = await http.get(Uri.parse(Config.urlBase +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=${Config.chaveYoutubeApi}"
            "&channelId=${Config.idCanal}"
            "&q=$pesquisa"));
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      videos = dadosJson["items"].map<Video>(
        (map) {
          return Video.fromJson(map);
        },
      ).toList();
    } else {
      print("Erro: ${response.statusCode}");
    }
    return videos;
  }
}
