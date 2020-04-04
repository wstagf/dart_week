import 'package:dart_week_api/controllers/movimentacoes/dto/salvarMovimentacaoRequest.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
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

  Future<Map<String, dynamic>> buscarTotalMovimentacoesPorTipoCategoria(
      UsuarioModel usuarioModel, String anoMes) async {
    final receitas = await repository.buscarTotalMovimentacoesPorTipoCategoria(
        usuarioModel, anoMes, TipoCategoria.receita);
    final despesas = await repository.buscarTotalMovimentacoesPorTipoCategoria(
        usuarioModel, anoMes, TipoCategoria.despesa);

    return {
      'receitas': receitas,
      'despesas': despesas,
      'total': (receitas['total'] ?? 0) + (despesas['total'] ?? 0),
      'saldo': (receitas['total'] ?? 0) + (despesas['total'] * -1 ?? 0)
    };
  }

  Future<void> salvarMovimentacao(
      UsuarioModel usuario, SalvarMovimentacaoRequest request) async {
    await repository.salvarMovimentacao(usuario, request);
  }
}
