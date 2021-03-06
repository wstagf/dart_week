import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../components/controleja_buttom.dart';
import '../../components/controleja_text_form_field.dart';
import '../../core/store_state.dart';
import '../../mixins/loader_mixin.dart';
import '../../utils/size_utils.dart';
import '../../utils/theme_utils.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController>
    with LoaderMixin {
  // use 'controller' variable to access controller

  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
        }
      }),
      reaction((_) => controller.loginSuccess, (sucess) {
        if (sucess != null) {
          if (sucess) {
            Get.offAllNamed('/movimentacoes');
          } else {
            Get.snackbar('Erro ao realizar login', 'Login ou senha inválidos',
                backgroundColor: Colors.white);
          }
        }
      }),
      reaction((_) => controller.errorMessage, (errorMessage) {
        if (errorMessage.isNotEmpty) {
          hideLoader();

          Get.snackbar('Erro ao realizar login', errorMessage,
              backgroundColor: Colors.white);
        }
      }),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _disposer.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _makerHeader(),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            _makeForm(),
          ],
        ),
      ),
    );
  }

  Widget _makerHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      width: SizeUtils.widthScreen,
      height: (SizeUtils.heigthScreen * 0.4) - SizeUtils.statusBarHeigth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: SizeUtils.heigthScreen * 0.05,
            child: Image.asset(
              'assets/images/logo.png',
              key: Key('image_logo'),
              width: SizeUtils.widthScreen * 0.5,
              height: 80,
            ),
          )
        ],
      ),
    );
  }

  Widget _makeForm() {
    return Form(
      key: controller.globalKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            ControlejaTextFormField(
              key: Key('login_text_input'),
              label: "Login",
              iconData: Icons.perm_identity,
              onChanged: controller.changeLogin,
              validator: controller.validateLogin,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              key: Key('senha_text_input'),
              label: "Senha",
              iconData: Icons.lock,
              onChanged: controller.changeSenha,
              validator: controller.validateSenha,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControleJaButtom(
              label: "Entrar",
              key: Key('login_button'),
              onPressed: () => controller.requestLogin(),
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            FlatButton(
              onPressed: () => Get.toNamed("login/cadastro"),
              child: Text(
                'Cadastre-se',
                key: Key('cadastre_button'),
                style: TextStyle(
                  color: ThemeUtils.primaryColor,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
