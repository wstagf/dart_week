import 'package:minhaConta/app/core/custom_dio.dart';
import 'package:minhaConta/app/models/movimentacao_model.dart';
import 'package:minhaConta/app/models/movimentacao_total_model.dart';

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
}
