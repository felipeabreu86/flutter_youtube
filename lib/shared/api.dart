import 'package:flutter_youtube/shared/config.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      Config.urlBase +
          "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=20"
              "&order=date"
              "&key=${Config.chaveYoutubeApi}"
              "&channelId=${Config.idCanal}"
              "&q=$pesquisa",
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      print(dadosJson);
    } else {
      print("erro");
    }
  }
}
