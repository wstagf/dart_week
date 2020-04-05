import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaConta/app/components/controlejaTextFormField.dart';
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
      body: Column(
        children: <Widget>[_makerHeader(), SizedBox(height: 30.0), _makeForm()],
      ),
    );
  }

  Widget _makerHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      width: SizeUtils.widthScreen,
      height: (SizeUtils.heigthScreen * 0.5) - SizeUtils.statusBarHeigth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 40,
            child: Image.asset(
              'assets/images/logo.png',
              width: SizeUtils.widthScreen * 0.6,
            ),
          )
        ],
      ),
    );
  }

  Widget _makeForm() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            ControlejaTextFormField(
              label: "Login",
            ),
            SizedBox(
              height: 30,
            ),
            ControlejaTextFormField(
              label: "Senha",
            )
          ],
        ),
      ),
    );
  }
}
