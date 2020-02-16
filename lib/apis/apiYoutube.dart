import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = ""; // Inserir chave valida para API do Youtube
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response resposta = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    if (resposta.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(resposta.body);
      print("resultado: ${resposta.body}");
    } else {
      print("erro");
    }
  }
}
