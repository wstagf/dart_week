import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaConta/app/modules/home/home_controller.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:minhaConta/app/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.verificaLogado();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeUtils.init(context);
    SizeUtils.init(context);

    return Scaffold(
      backgroundColor: ThemeUtils.primaryColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
