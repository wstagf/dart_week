import '../../models/movimentacao_model.dart';
import '../../models/movimentacao_total_model.dart';

mixin IMovimentacoesRepository {
  Future<List<MovimentacaoModel>> getMovimentacoes(String anoMes);
  Future<MovimentacaoTotalModel> getTotalMes(String anoMes);
  Future<void> salvarMovimentacao(
      int categoria, DateTime dataMovimentacao, String descricao, double valor);
}
