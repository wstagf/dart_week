import 'package:flutter_modular/flutter_modular.dart';
import '../../repositories/usuario_repository.dart';
import 'cadastro_controller.dart';
import 'cadastro_page.dart';

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
