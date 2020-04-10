import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/models/movimentacao_total_model.dart';
import 'package:minhaConta/app/repositories/movimentacoes_repository.dart';
import 'package:minhaConta/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'painel_saldo_controller.g.dart';

class PainelSaldoController = _PainelSaldoBase with _$PainelSaldoController;

abstract class _PainelSaldoBase with Store {
  final MovimentacoesRepository movimentacoesRepository;

  _PainelSaldoBase(this.movimentacoesRepository);

  @observable
  DateTime data = DateTime.now();

  @computed
  String get anoMes => DateFormat('yyyyMM').format(data);

  @action
  mesProximo() {
    data = DateTime(data.year, data.month + 1, 1);
  }

  @action
  mesAnterior() {
    data = DateTime(data.year, data.month - 1, 1);
  }

  @observable
  String errorMessage;

  @observable
  ObservableFuture<MovimentacaoTotalModel> _totalMovimentacao;

  @computed
  StoreState get totalState => StoreUtils.statusCheck(_totalMovimentacao);

  @observable
  MovimentacaoTotalModel movimentacaoTotalModel;

  @action
  buscarTotalDoMes() async {
    try {
      errorMessage = '';
      _totalMovimentacao =
          ObservableFuture(movimentacoesRepository.getTotalMes(anoMes));
      movimentacaoTotalModel = await _totalMovimentacao;
    } catch (e) {
      errorMessage = 'Erro ao buscar total de movimentações';
      print(e);
    }
  }
}
