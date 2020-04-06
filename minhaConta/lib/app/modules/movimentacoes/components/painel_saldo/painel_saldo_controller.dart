import 'package:mobx/mobx.dart';

part 'painel_saldo_controller.g.dart';

class PainelSaldoController = _PainelSaldoBase with _$PainelSaldoController;

abstract class _PainelSaldoBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
