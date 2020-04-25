import 'dart:convert';

import 'package:intl/intl.dart';
import 'categoria_model.dart';

class MovimentacaoModel {
  int id;
  DateTime dataMovimentacao;
  String descricao;
  double valor;
  CategoriaModel categoria;
  MovimentacaoModel({
    this.id,
    this.dataMovimentacao,
    this.descricao,
    this.valor,
    this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dataMovimentacao': dataMovimentacao.millisecondsSinceEpoch,
      'descricao': descricao,
      'valor': valor,
      'categoria': categoria.toMap(),
    };
  }

  static MovimentacaoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    var formatDate = DateFormat('y-mm-d');
    return MovimentacaoModel(
      id: map['id'],
      dataMovimentacao: formatDate.parse(map['dataMovimentacao']),
      descricao: map['descricao'],
      valor: map['valor'],
      categoria: CategoriaModel.fromMap(map['categoria']),
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovimentacaoModel &&
        o.id == id &&
        o.dataMovimentacao == dataMovimentacao &&
        o.descricao == descricao &&
        o.valor == valor &&
        o.categoria == categoria;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dataMovimentacao.hashCode ^
        descricao.hashCode ^
        valor.hashCode ^
        categoria.hashCode;
  }
}
