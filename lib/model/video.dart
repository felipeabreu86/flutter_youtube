import 'dart:convert';

class Video {
  String id;
  String titulo;
  String imagem;
  String canal;
  String descricao;

  Video({
    required this.id,
    required this.titulo,
    required this.imagem,
    required this.canal,
    required this.descricao,
  });

  Video copyWith({
    String? id,
    String? titulo,
    String? imagem,
    String? canal,
    String? descricao,
  }) {
    return Video(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      imagem: imagem ?? this.imagem,
      canal: canal ?? this.canal,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'imagem': imagem,
      'canal': canal,
      'descricao': descricao,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'],
      titulo: map['titulo'],
      imagem: map['imagem'],
      canal: map['canal'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Video(id: $id, titulo: $titulo, imagem: $imagem, canal: $canal, descricao: $descricao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Video &&
        other.id == id &&
        other.titulo == titulo &&
        other.imagem == imagem &&
        other.canal == canal &&
        other.descricao == descricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        imagem.hashCode ^
        canal.hashCode ^
        descricao.hashCode;
  }
}
