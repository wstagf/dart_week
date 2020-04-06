import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_page.dart';

class MovimentacoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PainelSaldoController()),
        Bind((i) => MovimentacoesController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MovimentacoesPage()),
      ];

  static Inject get to => Inject<MovimentacoesModule>.of();
}
