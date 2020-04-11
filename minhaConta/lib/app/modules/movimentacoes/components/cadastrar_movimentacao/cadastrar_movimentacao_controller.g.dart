// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_movimentacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastrarMovimentacaoController on _CadastrarMovimentacaoBase, Store {
  Computed<StoreState> _$categoriaStatusComputed;

  @override
  StoreState get categoriaStatus => (_$categoriaStatusComputed ??=
          Computed<StoreState>(() => super.categoriaStatus))
      .value;
  Computed<StoreState> _$salvarMovimentacaoStatusComputed;

  @override
  StoreState get salvarMovimentacaoStatus =>
      (_$salvarMovimentacaoStatusComputed ??=
              Computed<StoreState>(() => super.salvarMovimentacaoStatus))
          .value;

  final _$dataInclusaoAtom =
      Atom(name: '_CadastrarMovimentacaoBase.dataInclusao');

  @override
  DateTime get dataInclusao {
    _$dataInclusaoAtom.context.enforceReadPolicy(_$dataInclusaoAtom);
    _$dataInclusaoAtom.reportObserved();
    return super.dataInclusao;
  }

  @override
  set dataInclusao(DateTime value) {
    _$dataInclusaoAtom.context.conditionallyRunInAction(() {
      super.dataInclusao = value;
      _$dataInclusaoAtom.reportChanged();
    }, _$dataInclusaoAtom, name: '${_$dataInclusaoAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_CadastrarMovimentacaoBase.errorMessage');

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

  final _$tipoSelecionadoAtom =
      Atom(name: '_CadastrarMovimentacaoBase.tipoSelecionado');

  @override
  String get tipoSelecionado {
    _$tipoSelecionadoAtom.context.enforceReadPolicy(_$tipoSelecionadoAtom);
    _$tipoSelecionadoAtom.reportObserved();
    return super.tipoSelecionado;
  }

  @override
  set tipoSelecionado(String value) {
    _$tipoSelecionadoAtom.context.conditionallyRunInAction(() {
      super.tipoSelecionado = value;
      _$tipoSelecionadoAtom.reportChanged();
    }, _$tipoSelecionadoAtom, name: '${_$tipoSelecionadoAtom.name}_set');
  }

  final _$categoriasAtom = Atom(name: '_CadastrarMovimentacaoBase.categorias');

  @override
  List<CategoriaModel> get categorias {
    _$categoriasAtom.context.enforceReadPolicy(_$categoriasAtom);
    _$categoriasAtom.reportObserved();
    return super.categorias;
  }

  @override
  set categorias(List<CategoriaModel> value) {
    _$categoriasAtom.context.conditionallyRunInAction(() {
      super.categorias = value;
      _$categoriasAtom.reportChanged();
    }, _$categoriasAtom, name: '${_$categoriasAtom.name}_set');
  }

  final _$categoriaAtom = Atom(name: '_CadastrarMovimentacaoBase.categoria');

  @override
  CategoriaModel get categoria {
    _$categoriaAtom.context.enforceReadPolicy(_$categoriaAtom);
    _$categoriaAtom.reportObserved();
    return super.categoria;
  }

  @override
  set categoria(CategoriaModel value) {
    _$categoriaAtom.context.conditionallyRunInAction(() {
      super.categoria = value;
      _$categoriaAtom.reportChanged();
    }, _$categoriaAtom, name: '${_$categoriaAtom.name}_set');
  }

  final _$categoriaValidAtom =
      Atom(name: '_CadastrarMovimentacaoBase.categoriaValid');

  @override
  bool get categoriaValid {
    _$categoriaValidAtom.context.enforceReadPolicy(_$categoriaValidAtom);
    _$categoriaValidAtom.reportObserved();
    return super.categoriaValid;
  }

  @override
  set categoriaValid(bool value) {
    _$categoriaValidAtom.context.conditionallyRunInAction(() {
      super.categoriaValid = value;
      _$categoriaValidAtom.reportChanged();
    }, _$categoriaValidAtom, name: '${_$categoriaValidAtom.name}_set');
  }

  final _$descricaoAtom = Atom(name: '_CadastrarMovimentacaoBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_CadastrarMovimentacaoBase.valor');

  @override
  double get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$_categoriasFutureAtom =
      Atom(name: '_CadastrarMovimentacaoBase._categoriasFuture');

  @override
  ObservableFuture<List<CategoriaModel>> get _categoriasFuture {
    _$_categoriasFutureAtom.context.enforceReadPolicy(_$_categoriasFutureAtom);
    _$_categoriasFutureAtom.reportObserved();
    return super._categoriasFuture;
  }

  @override
  set _categoriasFuture(ObservableFuture<List<CategoriaModel>> value) {
    _$_categoriasFutureAtom.context.conditionallyRunInAction(() {
      super._categoriasFuture = value;
      _$_categoriasFutureAtom.reportChanged();
    }, _$_categoriasFutureAtom, name: '${_$_categoriasFutureAtom.name}_set');
  }

  final _$_salvarMovimentacaoFutureAtom =
      Atom(name: '_CadastrarMovimentacaoBase._salvarMovimentacaoFuture');

  @override
  ObservableFuture<dynamic> get _salvarMovimentacaoFuture {
    _$_salvarMovimentacaoFutureAtom.context
        .enforceReadPolicy(_$_salvarMovimentacaoFutureAtom);
    _$_salvarMovimentacaoFutureAtom.reportObserved();
    return super._salvarMovimentacaoFuture;
  }

  @override
  set _salvarMovimentacaoFuture(ObservableFuture<dynamic> value) {
    _$_salvarMovimentacaoFutureAtom.context.conditionallyRunInAction(() {
      super._salvarMovimentacaoFuture = value;
      _$_salvarMovimentacaoFutureAtom.reportChanged();
    }, _$_salvarMovimentacaoFutureAtom,
        name: '${_$_salvarMovimentacaoFutureAtom.name}_set');
  }

  final _$buscarCategoriasAsyncAction = AsyncAction('buscarCategorias');

  @override
  Future<void> buscarCategorias(String tipo) {
    return _$buscarCategoriasAsyncAction
        .run(() => super.buscarCategorias(tipo));
  }

  final _$salvarMovimentoAsyncAction = AsyncAction('salvarMovimento');

  @override
  Future salvarMovimento() {
    return _$salvarMovimentoAsyncAction.run(() => super.salvarMovimento());
  }

  final _$_CadastrarMovimentacaoBaseActionController =
      ActionController(name: '_CadastrarMovimentacaoBase');

  @override
  void changeCategoria(CategoriaModel categoriaModel) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.changeCategoria(categoriaModel);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDescricao(String descricaoValue) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.changeDescricao(descricaoValue);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValor(String valorValue) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.changeValor(valorValue);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInclusao(DateTime data) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.setDataInclusao(data);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateDescricao(String value) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.validateDescricao(value);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validateValor(String value) {
    final _$actionInfo =
        _$_CadastrarMovimentacaoBaseActionController.startAction();
    try {
      return super.validateValor(value);
    } finally {
      _$_CadastrarMovimentacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'dataInclusao: ${dataInclusao.toString()},errorMessage: ${errorMessage.toString()},tipoSelecionado: ${tipoSelecionado.toString()},categorias: ${categorias.toString()},categoria: ${categoria.toString()},categoriaValid: ${categoriaValid.toString()},descricao: ${descricao.toString()},valor: ${valor.toString()},categoriaStatus: ${categoriaStatus.toString()},salvarMovimentacaoStatus: ${salvarMovimentacaoStatus.toString()}';
    return '{$string}';
  }
}
