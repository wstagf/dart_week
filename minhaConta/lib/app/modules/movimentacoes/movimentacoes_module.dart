import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/categorias_repository.dart';
import '../../repositories/movimentacoes_repository.dart';
import 'components/cadastrar_movimentacao/cadastrar_movimentacao_controller.dart';
import 'components/painel_saldo/painel_saldo_controller.dart';
import 'movimentacoes_controller.dart';
import 'movimentacoes_page.dart';

class MovimentacoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastrarMovimentacaoController()),
        Bind((i) => PainelSaldoController(
              i.get<MovimentacoesRepository>(),
            )),
        Bind((i) => MovimentacoesRepository()),
        Bind((i) => CategoriaRepository()),
        Bind((i) => MovimentacoesController(
            i.get<MovimentacoesRepository>(), i.get<PainelSaldoController>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MovimentacoesPage()),
      ];

  static Inject get to => Inject<MovimentacoesModule>.of();
}
