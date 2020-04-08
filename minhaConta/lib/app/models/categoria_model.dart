import 'dart:convert';

class CategoriaModel {
  int id;
  String nome;

  CategoriaModel({
    this.id,
    this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  static CategoriaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoriaModel(
      id: map['id'],
      nome: map['nome'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoriaModel fromJson(String source) => fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoriaModel && o.id == id && o.nome == nome;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode;
}
