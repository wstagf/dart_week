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
  Computed<StoreState> _$totalStateComputed;

  @override
  StoreState get totalState =>
      (_$totalStateComputed ??= Computed<StoreState>(() => super.totalState))
          .value;

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

  final _$errorMessageAtom = Atom(name: '_PainelSaldoBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_totalMovimentacaoAtom =
      Atom(name: '_PainelSaldoBase._totalMovimentacao');

  @override
  ObservableFuture<MovimentacaoTotalModel> get _totalMovimentacao {
    _$_totalMovimentacaoAtom.context
        .enforceReadPolicy(_$_totalMovimentacaoAtom);
    _$_totalMovimentacaoAtom.reportObserved();
    return super._totalMovimentacao;
  }

  @override
  set _totalMovimentacao(ObservableFuture<MovimentacaoTotalModel> value) {
    _$_totalMovimentacaoAtom.context.conditionallyRunInAction(() {
      super._totalMovimentacao = value;
      _$_totalMovimentacaoAtom.reportChanged();
    }, _$_totalMovimentacaoAtom, name: '${_$_totalMovimentacaoAtom.name}_set');
  }

  final _$movimentacaoTotalModelAtom =
      Atom(name: '_PainelSaldoBase.movimentacaoTotalModel');

  @override
  MovimentacaoTotalModel get movimentacaoTotalModel {
    _$movimentacaoTotalModelAtom.context
        .enforceReadPolicy(_$movimentacaoTotalModelAtom);
    _$movimentacaoTotalModelAtom.reportObserved();
    return super.movimentacaoTotalModel;
  }

  @override
  set movimentacaoTotalModel(MovimentacaoTotalModel value) {
    _$movimentacaoTotalModelAtom.context.conditionallyRunInAction(() {
      super.movimentacaoTotalModel = value;
      _$movimentacaoTotalModelAtom.reportChanged();
    }, _$movimentacaoTotalModelAtom,
        name: '${_$movimentacaoTotalModelAtom.name}_set');
  }

  final _$buscarTotalDoMesAsyncAction = AsyncAction('buscarTotalDoMes');

  @override
  Future buscarTotalDoMes() {
    return _$buscarTotalDoMesAsyncAction.run(() => super.buscarTotalDoMes());
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
    final string =
        'data: ${data.toString()},errorMessage: ${errorMessage.toString()},movimentacaoTotalModel: ${movimentacaoTotalModel.toString()},anoMes: ${anoMes.toString()},totalState: ${totalState.toString()}';
    return '{$string}';
  }
}
