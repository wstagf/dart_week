import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/home/home_controller.dart';
import 'package:minhaConta/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  HomeController home;

  setUp(() {
    home = HomeModule.to.get<HomeController>();
  });

  group('HomeController Test', () {});
}
