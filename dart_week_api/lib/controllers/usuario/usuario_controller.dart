import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/services/usuario_services.dart';

import 'dto/cadastrarUsuarioRequest.dart';

class UsuarioController extends ResourceController {
  UsuarioController(this.context) : usuarioService = UsuarioService(context);

  final ManagedContext context;
  final UsuarioService usuarioService;

  @Operation.post()
  Future<Response> salvar(@Bind.body() CadastrarUsuarioRequest request) async {
    final validate = request.validate();

    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }

    try {
      await usuarioService.salvarUsuario(request);
      return Response.ok({'message': 'Usuário cadastrado com sucesso'});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'Erro ao salvar usuário',
        'exception': e.toString()
      });
    }
  }
}
