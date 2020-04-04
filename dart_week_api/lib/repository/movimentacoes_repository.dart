import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/model/movimentacao_model.dart';
import 'package:dart_week_api/model/usuario_model.dart';
import 'package:intl/intl.dart';

class MovimentacoesRepository {
  MovimentacoesRepository(this.context);

  final ManagedContext context;

  Future<List<MovimentacaoModel>> buscarMovimentacoes(
      UsuarioModel usuarioModel, String anoMes) {
    final DateFormat format = DateFormat('yyyy_MM_DD');
    final inicio =
        format.parse('${anoMes.substring(0, 4)}_${anoMes.substring(4)}_01');
    final fim =
        format.parse('${anoMes.substring(0, 4)}_${anoMes.substring(4)}_31');

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).equalTo(usuarioModel.id)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..sortBy((m) => m.dataMovimentacao, QuerySortOrder.descending)
      ..sortBy((m) => m.id, QuerySortOrder.descending);

    return query.fetch();
  }

  Future<Map<String, dynamic>> buscarTotalMovimentacoesPorTipoCategoria(
      UsuarioModel usuarioModel,
      String anoMes,
      TipoCategoria tipoCategoria) async {
    final DateFormat format = DateFormat('yyyy_MM_DD');
    final inicio =
        format.parse('${anoMes.substring(0, 4)}_${anoMes.substring(4)}_01');
    final fim =
        format.parse('${anoMes.substring(0, 4)}_${anoMes.substring(4)}_31');

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).equalTo(usuarioModel.id)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..where((m) => m.categoria.tipoCategoria).equalTo(tipoCategoria);

    final List<MovimentacaoModel> resultado = await query.fetch();

    final double total =
        resultado.fold(0.0, (total, m) => total = total + m.valor);

    return {'tipo': tipoCategoria.toString(), 'total': total};
  }
}
