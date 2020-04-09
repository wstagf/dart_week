import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeUtils.init(context);
    SizeUtils.init(context);

    Future.delayed(Duration(seconds: 2), () async {
      if (await Modular.get<UsuarioRepository>().isLogged()) {
        Get.offAllNamed('/movimentacoes');
      } else {
        Get.offAllNamed('/login');
      }
    });

    return Scaffold(
      backgroundColor: ThemeUtils.primaryColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
