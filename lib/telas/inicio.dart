import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/service/youtubeService.dart';
import '../model/video.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos() {
    YoutubeService apiYoutube = YoutubeService();
    return apiYoutube.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao realizar a requisição."),
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
                child: Text("Nenhum resultado a ser exibido."),
              );
            }
            break;
          case ConnectionState.none:
            return Center(
              child: Text("Sem conexão com a Internet."),
            );
            break;
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
            break;
        }
        return null;
      },
    );
  }
}
