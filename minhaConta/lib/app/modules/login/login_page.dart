import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:minhaConta/app/components/controleja_buttom.dart';
import 'package:minhaConta/app/components/controleja_text_form_field.dart';
import 'package:minhaConta/app/modules/login/login_controller.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  // use 'controller' variable to access controller

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
              label: "Login",
              iconData: Icons.perm_identity,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              label: "Senha",
              iconData: Icons.lock,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControleJaButtom(
              label: "Entrar",
              onPressed: () => Get.toNamed("movimentacoes"),
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            FlatButton(
              onPressed: () => Get.toNamed("login/cadastro"),
              child: Text(
                'Cadastre-se',
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
