import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:minhaConta/app/components/controleja_buttom.dart';
import 'package:minhaConta/app/components/controleja_text_form_field.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/mixins/loading_mixin.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_controller.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';
import 'package:mobx/mobx.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends ModularState<CadastroPage, CadastroController>
    with LoagingMixin {
  // use 'controller' variable to access controller
  AppBar appBar = AppBar(
    elevation: 0,
  );

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
          Get.snackbar('Sucesso', 'Cadastro realizado com sucesso',
              backgroundColor: Colors.white);
          Get.offAllNamed('/login');
        }
      }),
      reaction((_) => controller.errorMessage, (errorMessage) {
        if (errorMessage.isNotEmpty) {
          hideLoader();

          Get.snackbar('Erro ao cadastrar usuário', errorMessage,
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
              onChanged: controller.changeLogin,
              validator: controller.validateLogin,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              label: "Senha",
              iconData: Icons.lock,
              onChanged: controller.changeSenha,
              validator: controller.validateSenha,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControlejaTextFormField(
              label: "Confirma senha",
              iconData: Icons.lock,
              onChanged: controller.changeConfirmaSenha,
              validator: controller.validateConfirmaSenha,
            ),
            SizedBox(
              height: SizeUtils.heigthScreen * 0.05,
            ),
            ControleJaButtom(
              label: "Salvar",
              onPressed: controller.requestCadastro,
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
