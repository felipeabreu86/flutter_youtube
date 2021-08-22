# YouTube
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/felipeabreu86/flutter_youtube/blob/main/LICENSE) 

# Sobre o Projeto

**YouTube** é um projeto mobile cross-platform construído em Flutter voltado para o meu estudo pessoal relacionado a esta tecnologia.

A aplicação consiste em replicar o layout e implementar o funcionamento básico do YouTube por meio da API do Google.

## Layout Mobile
![Mobile 1](https://github.com/felipeabreu86/flutter_youtube/blob/main/assets/screens/mobile1.jpeg)
![Mobile 2](https://github.com/felipeabreu86/flutter_youtube/blob/main/assets/screens/mobile2.jpeg)
![Mobile 3](https://github.com/felipeabreu86/flutter_youtube/blob/main/assets/screens/mobile3.jpeg)

# Tecnologias Utilizadas
- [flutter](https://flutter.dev/ "flutter")
- [dart](https://dart.dev "dart")
- [http](https://pub.dev/packages/http "http")
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter "youtube_player_flutter")
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv "flutter_dotenv")

# Funcionalidades
- Tela Home do YouTube
- Pesquisa e exibição de vídeos utilizando Api do Google para o YouTube

# Como Executar o Projeto

## Flutter
Pré-requisitos: 
- Flutter ([como instalar](https://flutter.dev/docs/get-started/install "Como instalar o Flutter"))
- Android: minSdkVersion 17 (Android 4.2) e suporte para o androidx
- iOS: --ios-language swift, Xcode version >= 11

```bash
# clonar repositório
git clone https://github.com/felipeabreu86/flutter_youtube.git

# entrar na pasta do projeto
cd flutter_youtube

# rodar o comando abaixo para obter as dependências do projeto
flutter pub get

# descobrir os dispositivos disponíveis para executar o app
# copiar o ID do dispositivo para utilizá-lo no próximo comando 
flutter devices

# rodar o projeto no seu dispositivo
flutter run -d <Device ID>
```

# Autor

Felipe Abreu

https://www.linkedin.com/in/feabreu/