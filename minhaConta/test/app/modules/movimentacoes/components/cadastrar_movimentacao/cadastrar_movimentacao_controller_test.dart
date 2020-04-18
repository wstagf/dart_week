import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/cadastrar_movimentacao/cadastrar_movimentacao_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_module.dart';

void main() {
  initModule(MovimentacoesModule());
  CadastrarMovimentacaoController cadastrarmovimentacao;

  setUp(() {
    cadastrarmovimentacao =
        MovimentacoesModule.to.get<CadastrarMovimentacaoController>();
  });

  group('CadastrarMovimentacaoController Test', () {});
}
