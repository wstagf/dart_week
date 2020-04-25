import '../core/custom_dio.dart';
import '../models/movimentacao_model.dart';
import '../models/movimentacao_total_model.dart';

class MovimentacoesRepository {
  Future<List<MovimentacaoModel>> getMovimentacoes(String anoMes) {
    final dio = CustomDio.whithAutentication().instance;
    return dio.get('/movimentacoes/$anoMes').then((res) => res.data
        .map<MovimentacaoModel>((c) => MovimentacaoModel.fromMap(c))
        .toList());
  }

  Future<MovimentacaoTotalModel> getTotalMes(String anoMes) {
    final dio = CustomDio.whithAutentication().instance;
    return dio
        .get('/movimentacoes/total/$anoMes')
        .then((res) => MovimentacaoTotalModel.fromMap(res.data));
  }

  Future<void> salvarMovimentacao(int categoria, DateTime dataMovimentacao,
      String descricao, double valor) {
    final dio = CustomDio.whithAutentication().instance;
    return dio.post('/movimentacoes', data: {
      'categoria': categoria,
      'dataMovimentacao': dataMovimentacao.toIso8601String(),
      'descricao': descricao,
      'valor': valor
    });
  }
}
