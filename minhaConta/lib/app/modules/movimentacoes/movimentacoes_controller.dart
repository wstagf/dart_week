import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/models/movimentacao_model.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/repositories/movimentacoes_repository.dart';
import 'package:minhaConta/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'movimentacoes_controller.g.dart';

class MovimentacoesController = _MovimentacoesBase
    with _$MovimentacoesController;

abstract class _MovimentacoesBase with Store {
  final MovimentacoesRepository repository;
  final PainelSaldoController painelSaldoController;
  _MovimentacoesBase(this.repository, this.painelSaldoController);

  @observable
  String errorMessage;

  @observable
  ObservableList<MovimentacaoModel> movimentacoes;

  @observable
  ObservableFuture<List<MovimentacaoModel>> _movimentacoesFuture;

  @computed
  StoreState get movimentacoesState =>
      StoreUtils.statusCheck(_movimentacoesFuture);

  @action
  Future<void> buscarMovimentacoes() async {
    try {
      _movimentacoesFuture = ObservableFuture(
          repository.getMovimentacoes(painelSaldoController.anoMes));
      List<MovimentacaoModel> resultado = await _movimentacoesFuture;
      movimentacoes = resultado.asObservable();
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao buscar movimentações';
    }
  }
}
