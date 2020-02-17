import 'dart:convert';

class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;
  
  Video({
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.canal,
  });

  Video copyWith({
    String id,
    String titulo,
    String descricao,
    String imagem,
    String canal,
  }) {
    return Video(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      imagem: imagem ?? this.imagem,
      canal: canal ?? this.canal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'imagem': imagem,
      'canal': canal,
    };
  }

  static Video fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Video(
      id: map['id']['videoId'],
      titulo: map['snippet']['title'],
      descricao: map['snippet']['description'],
      imagem: map['snippet']['thumbnails']['high']['url'],
      canal: map['snippet']['channelId'],
    );
  }

  String toJson() => json.encode(toMap());

  static Video fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Video id: $id, titulo: $titulo, descricao: $descricao, imagem: $imagem, canal: $canal';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Video &&
      o.id == id &&
      o.titulo == titulo &&
      o.descricao == descricao &&
      o.imagem == imagem &&
      o.canal == canal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      titulo.hashCode ^
      descricao.hashCode ^
      imagem.hashCode ^
      canal.hashCode;
  }
}
