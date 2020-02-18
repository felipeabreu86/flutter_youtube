import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/telas/biblioteca.dart';
import 'package:flutter_youtube_app/telas/emAlta.dart';
import 'package:flutter_youtube_app/telas/inicio.dart';
import 'package:flutter_youtube_app/telas/inscricoes.dart';

class HomeBloc {
  // Armazena o índice da tela exibida na Home
  int _indexTela = 0;
  int get indexTela => _indexTela;

  // Lista de telas exibidas no BottomNavigationBar da tela Home
  List<Widget> _telas = [Inicio(), EmAlta(), Inscricoes(), Biblioteca()];

  // Variável instancia o StreamController
  final _telaController = StreamController<Widget>();
  final _bottomNavigationController = StreamController<int>();

  // Stream para quem deseja observar os eventos deste Bloc
  Stream<Widget> get telaStream => _telaController.stream;
  Stream<int> get bottomNavigationStream => _bottomNavigationController.stream;

  // Atualiza o índice da tela exibida na Home e adiciona ao StreamController
  void atualizarIndex(int indice) {
    _indexTela = indice;
    _telaController.sink.add(_telas[_indexTela]);
    _bottomNavigationController.sink.add(_indexTela);
  }

  // Recupera a Widget da tela inicial
  Widget recuperarTelaInicial() {
    return _telas[0];
  }

  // Fecha a Stream
  fecharStream() {
    _telaController.close();
    _bottomNavigationController.close();
  }
}
