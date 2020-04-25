import 'package:mockito/mockito.dart';

import '../../models/movimentacao_model.dart';
import '../../models/movimentacao_total_model.dart';
import '../interfaces/movimentacoes_repository_interface.dart';

class MovimentacoesRepositoryMock extends Mock
    implements IMovimentacoesRepository {
  Future<List<MovimentacaoModel>> getMovimentacoes(String anoMes) async {
    final ret = [];
    ret.add(MovimentacaoModel.fromMap({
      "id": 7,
      "dataMovimentacao": "2020-04-01",
      "descricao": "Curso Dart Week 1",
      "valor": 10.0,
      "categoria": {"id": 5, "nome": "Educação", "tipo": "despesa"}
    }));
    ret.add(MovimentacaoModel.fromMap({
      "id": 6,
      "dataMovimentacao": "2020-04-02",
      "descricao": "Curso Dart Week 2",
      "valor": 11.0,
      "categoria": {"id": 5, "nome": "Educação", "tipo": "despesa"}
    }));
    ret.add(MovimentacaoModel.fromMap({
      "id": 5,
      "dataMovimentacao": "2020-04-03",
      "descricao": "Curso Dart Week 3",
      "valor": 13.0,
      "categoria": {"id": 5, "nome": "Educação", "tipo": "despesa"}
    }));
    ret.add(MovimentacaoModel.fromMap({
      "id": 7,
      "dataMovimentacao": "2020-04-04",
      "descricao": "Curso Dart Week 4",
      "valor": 14.0,
      "categoria": {"id": 5, "nome": "Educação", "tipo": "despesa"}
    }));

    return ret;
  }

  Future<MovimentacaoTotalModel> getTotalMes(String anoMes) async {
    return MovimentacaoTotalModel.fromMap({
      "receitas": {"tipo": "TipoCategoria.receita", "total": 0.0},
      "despesas": {"tipo": "TipoCategoria.despesa", "total": 9093.0},
      "total": 9093.0,
      "saldo": -9093.0
    });
  }

  Future<void> salvarMovimentacao(
      int categoria, DateTime dataMovimentacao, String descricao, double valor);
}
