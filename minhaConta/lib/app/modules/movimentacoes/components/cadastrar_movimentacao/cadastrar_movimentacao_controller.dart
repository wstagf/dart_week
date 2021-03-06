import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/store_state.dart';
import '../../../../models/categoria_model.dart';
import '../../../../repositories/categorias_repository.dart';
import '../../../../repositories/movimentacoes_repository.dart';
import '../../../../utils/store_utils.dart';

part 'cadastrar_movimentacao_controller.g.dart';

class CadastrarMovimentacaoController = _CadastrarMovimentacaoBase
    with _$CadastrarMovimentacaoController;

abstract class _CadastrarMovimentacaoBase with Store {
  final formKey = GlobalKey<FormState>();
  final moneyController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  CategoriaRepository _categoriaRepository = Modular.get<CategoriaRepository>();
  MovimentacoesRepository _movimentacaoRepository =
      Modular.get<MovimentacoesRepository>();

  @observable
  DateTime dataInclusao = DateTime.now();

  @observable
  String errorMessage;

  @observable
  String tipoSelecionado;

  @observable
  List<CategoriaModel> categorias;

  @observable
  CategoriaModel categoria;

  @observable
  bool categoriaValid = true;

  @observable
  String descricao;

  @observable
  double valor;

  @action
  void changeCategoria(CategoriaModel categoriaModel) {
    categoria = categoriaModel;
  }

  @action
  void changeDescricao(String descricaoValue) {
    descricao = descricaoValue;
  }

  @action
  void changeValor(String valorValue) {
    valor = 0;
    //TODO rever esta funcao
  }

  @action
  void setDataInclusao(DateTime data) {
    dataInclusao = data;
  }

  @action
  String validateDescricao(String value) {
    if (value.isEmpty) {
      return 'Descrição obrigatória';
    }
    return null;
  }

  @action
  String validateValor(String value) {
    if (value.isEmpty) {
      return 'Valor obrigatório';
    }
    if (value == '0,00') {
      return 'Valor não pode ser zero';
    }
    return null;
  }

  @observable
  ObservableFuture<List<CategoriaModel>> _categoriasFuture;

  @computed
  StoreState get categoriaStatus => StoreUtils.statusCheck(_categoriasFuture);

  @action
  Future<void> buscarCategorias(String tipo) async {
    try {
      tipoSelecionado = tipo;
      _categoriasFuture =
          ObservableFuture(_categoriaRepository.getCategorias(tipo));
      List<CategoriaModel> categoriasModel = await _categoriasFuture;
      this.categorias = categoriasModel;
    } catch (e) {
      errorMessage = 'Erro ao buscar categorias';
      print(e);
    }
  }

  @observable
  ObservableFuture _salvarMovimentacaoFuture;

  @computed
  StoreState get salvarMovimentacaoStatus =>
      StoreUtils.statusCheck(_salvarMovimentacaoFuture);

  @action
  salvarMovimento() async {
    try {
      if (categoria == null) {
        categoriaValid = false;
      }
      if (formKey.currentState.validate()) {
        if (categoria != null) {
          categoriaValid = true;
          _salvarMovimentacaoFuture = ObservableFuture(
            _movimentacaoRepository.salvarMovimentacao(categoria.id,
                dataInclusao, descricao, moneyController.numberValue),
          );
          await _salvarMovimentacaoFuture;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  limparValores() {
    dataInclusao = DateTime.now();
    tipoSelecionado = null;
    categoria = null;
    moneyController.value = TextEditingValue(text: '0,00');
  }
}
