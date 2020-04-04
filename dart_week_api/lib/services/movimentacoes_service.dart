import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/movimentacao_model.dart';
import 'package:dart_week_api/model/usuario_model.dart';
import 'package:dart_week_api/repository/movimentacoes_repository.dart';

class MovimentacoesService {
  MovimentacoesService(this.context)
      : repository = MovimentacoesRepository(context);

  final ManagedContext context;
  final MovimentacoesRepository repository;

  Future<List<MovimentacaoModel>> buscarMovimentacoes(
      UsuarioModel usuarioModel, String anoMes) {
    return repository.buscarMovimentacoes(usuarioModel, anoMes);
  }
}
