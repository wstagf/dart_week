import 'package:minhaConta/app/modules/cadastro/cadastro_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaConta/app/modules/cadastro/cadastro_page.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CadastroController(i.get<UsuarioRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
