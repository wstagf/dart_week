import 'package:get/get.dart';
import 'package:minhaConta/app/mixins/loader_mixin.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store, LoaderMixin {
  final UsuarioRepository _usuarioRepository;

  _HomeBase(this._usuarioRepository);

  Future<void> verificaLogado() async {
    showLoader();
    if (await _usuarioRepository.isLogged()) {
      hideLoader();
      Get.offAllNamed('/movimentacoes');
    } else {
      hideLoader();
      Get.offAllNamed('/login');
    }
  }
}
