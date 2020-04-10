// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$loginAtom = Atom(name: '_CadastroBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_CadastroBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$confirmaSenhaAtom = Atom(name: '_CadastroBase.confirmaSenha');

  @override
  String get confirmaSenha {
    _$confirmaSenhaAtom.context.enforceReadPolicy(_$confirmaSenhaAtom);
    _$confirmaSenhaAtom.reportObserved();
    return super.confirmaSenha;
  }

  @override
  set confirmaSenha(String value) {
    _$confirmaSenhaAtom.context.conditionallyRunInAction(() {
      super.confirmaSenha = value;
      _$confirmaSenhaAtom.reportChanged();
    }, _$confirmaSenhaAtom, name: '${_$confirmaSenhaAtom.name}_set');
  }

  final _$_cadastraLoginFutureAtom =
      Atom(name: '_CadastroBase._cadastraLoginFuture');

  @override
  ObservableFuture<bool> get _cadastraLoginFuture {
    _$_cadastraLoginFutureAtom.context
        .enforceReadPolicy(_$_cadastraLoginFutureAtom);
    _$_cadastraLoginFutureAtom.reportObserved();
    return super._cadastraLoginFuture;
  }

  @override
  set _cadastraLoginFuture(ObservableFuture<bool> value) {
    _$_cadastraLoginFutureAtom.context.conditionallyRunInAction(() {
      super._cadastraLoginFuture = value;
      _$_cadastraLoginFutureAtom.reportChanged();
    }, _$_cadastraLoginFutureAtom,
        name: '${_$_cadastraLoginFutureAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_CadastroBase.errorMessage');

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

  final _$cadastroSuccessAtom = Atom(name: '_CadastroBase.cadastroSuccess');

  @override
  bool get cadastroSuccess {
    _$cadastroSuccessAtom.context.enforceReadPolicy(_$cadastroSuccessAtom);
    _$cadastroSuccessAtom.reportObserved();
    return super.cadastroSuccess;
  }

  @override
  set cadastroSuccess(bool value) {
    _$cadastroSuccessAtom.context.conditionallyRunInAction(() {
      super.cadastroSuccess = value;
      _$cadastroSuccessAtom.reportChanged();
    }, _$cadastroSuccessAtom, name: '${_$cadastroSuccessAtom.name}_set');
  }

  final _$requestCadastroAsyncAction = AsyncAction('requestCadastro');

  @override
  Future<void> requestCadastro() {
    return _$requestCadastroAsyncAction.run(() => super.requestCadastro());
  }

  final _$_CadastroBaseActionController =
      ActionController(name: '_CadastroBase');

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo = _$_CadastroBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_CadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String senhaValue) {
    final _$actionInfo = _$_CadastroBaseActionController.startAction();
    try {
      return super.changeSenha(senhaValue);
    } finally {
      _$_CadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConfirmaSenha(String confirmaSenhaValue) {
    final _$actionInfo = _$_CadastroBaseActionController.startAction();
    try {
      return super.changeConfirmaSenha(confirmaSenhaValue);
    } finally {
      _$_CadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'login: ${login.toString()},senha: ${senha.toString()},confirmaSenha: ${confirmaSenha.toString()},errorMessage: ${errorMessage.toString()},cadastroSuccess: ${cadastroSuccess.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
