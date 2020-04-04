import 'package:dart_week_api/controllers/usuario/dto/cadastrarUsuarioRequest.dart';
import 'package:dart_week_api/model/usuario_model.dart';
import 'package:dart_week_api/utils/criptografia_utils.dart';

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

  Future<void> salvarUsuario(CadastrarUsuarioRequest request) async {
    final usuarioSave = UsuarioModel()..read(request.asMap());
    usuarioSave.senha = CriptografiaUtils.criptografarSenha(request.senha);
    await context.insertObject(usuarioSave);
  }

  Future<UsuarioModel> buscarporId(int id) async {
    final query = Query<UsuarioModel>(context)
      ..where((usuario) => usuario.id).equalTo(id);
    return await query.fetchOne();
  }
}
