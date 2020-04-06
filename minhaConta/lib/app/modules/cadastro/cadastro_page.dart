import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:minhaConta/app/components/controleja_buttom.dart';
import 'package:minhaConta/app/components/controleja_text_form_field.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_controller.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  // use 'controller' variable to access controller
  AppBar appBar = AppBar(
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
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
      height: (SizeUtils.heigthScreen * 0.4) -
          SizeUtils.statusBarHeigth -
          appBar.preferredSize.height -
          SizeUtils.statusBarHeigth,
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
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              label: "Senha",
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              label: "Confirma senha",
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControleJaButtom(
              label: "Salvar",
              onPressed: () {},
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}