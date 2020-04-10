import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/models/categoria_model.dart';
import 'package:minhaConta/app/repositories/categorias_repository.dart';
import 'package:minhaConta/app/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'cadastrar_movimentacao_controller.g.dart';

class CadastrarMovimentacaoController = _CadastrarMovimentacaoBase
    with _$CadastrarMovimentacaoController;

abstract class _CadastrarMovimentacaoBase with Store {
  final formKey = GlobalKey<FormState>();
  final moneyController =
      MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  CategoriaRepository _categoriaRepository = Modular.get<CategoriaRepository>();

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
}
