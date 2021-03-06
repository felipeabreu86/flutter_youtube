import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter_youtube_app/services/youtubeService.dart';
import '../model/video.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    super.initState();
    print("Chamado 1 - initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2 - didChangeDependencies");
  }

  @override
  void dispose() {
    print("Chamado 4 - dispose");
    super.dispose();
  }

  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 - didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("Chamado 3 - build");
    return FutureBuilder<List<Video>>(
      future: YoutubeService.pesquisar(""),
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
                    Video video = snapshot.data[index];

                    return GestureDetector(
                      onTap: () {
                        FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API,
                          videoId: video.id,
                          autoPlay: true,
                          fullScreen: false,
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.imagem),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("Nenhum resultado a ser exibido."),
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
}
