import 'dart:convert';

class MovimentacaoTotalModel {
  double total;
  double saldo;
  MovimentacaoTotalModel receitas;
  MovimentacaoTotalModel despesas;

  MovimentacaoTotalModel({
    this.total,
    this.saldo,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'saldo': saldo,
    };
  }

  static MovimentacaoTotalModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovimentacaoTotalModel(
      total: map['total'],
      saldo: map['saldo'],
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoTotalModel fromJson(String source) =>
      fromMap(json.decode(source));
}
