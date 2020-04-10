// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painel_saldo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PainelSaldoController on _PainelSaldoBase, Store {
  Computed<String> _$anoMesComputed;

  @override
  String get anoMes =>
      (_$anoMesComputed ??= Computed<String>(() => super.anoMes)).value;

  final _$dataAtom = Atom(name: '_PainelSaldoBase.data');

  @override
  DateTime get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$_PainelSaldoBaseActionController =
      ActionController(name: '_PainelSaldoBase');

  @override
  dynamic mesProximo() {
    final _$actionInfo = _$_PainelSaldoBaseActionController.startAction();
    try {
      return super.mesProximo();
    } finally {
      _$_PainelSaldoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mesAnterior() {
    final _$actionInfo = _$_PainelSaldoBaseActionController.startAction();
    try {
      return super.mesAnterior();
    } finally {
      _$_PainelSaldoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'data: ${data.toString()},anoMes: ${anoMes.toString()}';
    return '{$string}';
  }
}
