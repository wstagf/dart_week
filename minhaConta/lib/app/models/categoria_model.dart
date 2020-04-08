import 'dart:convert';

class CategoriaModel {
  int id;
  String nome;
  String tipo;
  CategoriaModel({
    this.id,
    this.nome,
    this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
    };
  }

  static CategoriaModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoriaModel(
      id: map['id'],
      nome: map['nome'],
      tipo: map['tipo'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoriaModel fromJson(String source) => fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoriaModel &&
        o.id == id &&
        o.nome == nome &&
        o.tipo == tipo;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ tipo.hashCode;
}
