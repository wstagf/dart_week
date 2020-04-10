import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';

part 'painel_saldo_controller.g.dart';

class PainelSaldoController = _PainelSaldoBase with _$PainelSaldoController;

abstract class _PainelSaldoBase with Store {
  @observable
  DateTime data = DateTime.now();

  @computed
  String get anoMes => DateFormat('yyyyMM').format(data);
}
