import 'package:mobx/mobx.dart';

part 'movimentacoes_controller.g.dart';

class MovimentacoesController = _MovimentacoesBase
    with _$MovimentacoesController;

abstract class _MovimentacoesBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
