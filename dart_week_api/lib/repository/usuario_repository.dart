import 'package:dart_week_api/model/usuario_model.dart';

import '../dart_week_api.dart';

class UsuarioRepository {
  UsuarioRepository(this.context);

  final ManagedContext context;

  Future<UsuarioModel> recuperarUsuarioPorLoginESenha(
      String login, String senha) {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.login).equalTo(login)
      ..where((usuario) => usuario.senha).equalTo(senha);
    return query.fetchOne();
  }
}
