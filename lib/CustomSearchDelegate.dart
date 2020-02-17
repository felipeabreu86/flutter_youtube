import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/service/youtubeService.dart';
import 'model/video.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  String ultimaPesquisa = "";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _listarVideos() {
      YoutubeService apiYoutube = YoutubeService();
      if (query.isNotEmpty) {
        return apiYoutube.pesquisar(query);
      }
      return List<Video>();
    }

    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao realizar a requisição!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(snapshot.data[index].imagem),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(snapshot.data[index].titulo),
                        subtitle: Text(snapshot.data[index].canal),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.red,
                ),
                itemCount: snapshot.data.length,
              );
            } else {
              return Center(
                child: Text("Nenhum resultado para a pesquisa! 2"),
              );
            }
            break;
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
        }
        return null;
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //return Container();

    /// Implementação estática para estudo do funcionamento das sugestões
    List<String> lista = List();
    if (query.isNotEmpty) {
      lista = ["Android", "Android navegação", "IOS", "Jogos"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa! 1"),
      );
    }
  }
}
