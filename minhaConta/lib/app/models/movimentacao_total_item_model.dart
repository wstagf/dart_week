import 'dart:convert';

class MovimentacaoTotalItemModel {
  double total;
  String tipo;
  MovimentacaoTotalItemModel({
    this.total,
    this.tipo,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'tipo': tipo,
    };
  }

  static MovimentacaoTotalItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovimentacaoTotalItemModel(
      total: map['total'],
      tipo: map['tipo'],
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoTotalItemModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovimentacaoTotalItemModel &&
        o.total == total &&
        o.tipo == tipo;
  }

  @override
  int get hashCode => total.hashCode ^ tipo.hashCode;
}
