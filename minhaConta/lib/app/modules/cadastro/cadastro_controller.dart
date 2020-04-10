import 'package:flutter/material.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:minhaConta/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

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
  ObservableFuture<bool> _cadastraLoginFuture;

  @observable
  String errorMessage;

  @observable
  bool cadastroSuccess;

  @computed
  StoreState get state => StoreUtils.statusCheck(_cadastraLoginFuture);

  @action
  Future<void> requestCadastro() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        cadastroSuccess = null;
        // fazer post
        // _cadastraLoginFuture =
        //     ObservableFuture(usuarioRepository.login(login, senha));
        cadastroSuccess = await _cadastraLoginFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao realizar login';
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
