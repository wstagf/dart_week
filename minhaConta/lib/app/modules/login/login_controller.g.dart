// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$loginAtom = Atom(name: '_LoginBase.login');

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

  final _$senhaAtom = Atom(name: '_LoginBase.senha');

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

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String senhaValue) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeSenha(senhaValue);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'login: ${login.toString()},senha: ${senha.toString()}';
    return '{$string}';
  }
}
