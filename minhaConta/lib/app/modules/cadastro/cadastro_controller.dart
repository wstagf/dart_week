import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/store_state.dart';
import '../../repositories/usuario_repository.dart';
import '../../utils/store_utils.dart';

part 'cadastro_controller.g.dart';

class CadastroController = _CadastroBase with _$CadastroController;

abstract class _CadastroBase with Store {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final UsuarioRepository usuarioRepository;

  _CadastroBase(this.usuarioRepository);

  @observable
  String login;

  @observable
  String senha;

  @observable
  String confirmaSenha;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changeSenha(String senhaValue) => senha = senhaValue;

  @action
  changeConfirmaSenha(String confirmaSenhaValue) =>
      confirmaSenha = confirmaSenhaValue;

  @observable
  ObservableFuture _cadastraLoginFuture;

  @observable
  String errorMessage;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastraLoginFuture);

  @action
  Future<void> requestCadastro() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        _cadastraLoginFuture =
            ObservableFuture(usuarioRepository.cadastrarUsuaurio(login, senha));
        await _cadastraLoginFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao realizar cadastro';
      }
    }
  }

  String validateLogin(String value) {
    if (value.isEmpty) {
      return 'Login obrigatório';
    }
    return null;
  }

  String validateSenha(String value) {
    if (value.isEmpty) {
      return 'Senha obrigatória';
    }
    return null;
  }

  String validateConfirmaSenha(String value) {
    if (value.isEmpty) {
      return 'Confirmação de senha obrigatória';
    } else {
      if (value != senha) {
        return 'As senhas precisam sem idênticas';
      }
    }
    return null;
  }
}
