import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/mixins/loader_mixin.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/cadastrar_movimentacao/cadastrar_movimentacao_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/cadastrar_movimentacao/cadastrar_movimentacao_widget.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/movimentacao_item.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_widget.dart';
import 'package:minhaConta/app/modules/movimentacoes/movimentacoes_controller.dart';
import 'package:minhaConta/app/repositories/usuario_repository.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:mobx/mobx.dart';

class MovimentacoesPage extends StatefulWidget {
  const MovimentacoesPage({Key key}) : super(key: key);

  @override
  _MovimentacoesPageState createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState
    extends ModularState<MovimentacoesPage, MovimentacoesController>
    with LoaderMixin {
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    super.initState();
    controller.buscarMovimentacoes();

    disposers ??= [
      reaction((_) => controller.painelSaldoController.data,
          (_) => controller.buscarMovimentacoes()),
      reaction(
          (_) => Modular.get<CadastrarMovimentacaoController>()
              .salvarMovimentacaoStatus, (state) {
        switch (state) {
          case StoreState.loading:
            showLoader();
            break;
          case StoreState.initial:
            showLoader();
            break;
          case StoreState.error:
            hideLoader();
            Get.snackbar('Erro', 'Erro ao salvar movimentação');
            break;
          case StoreState.loaded:
            hideLoader();
            Get.back();
            Get.snackbar('Sucesso', 'Movimentação adicionada com sucesso');
            controller.buscarMovimentacoes();
            Modular.get<PainelSaldoController>().buscarTotalDoMes();
            break;
        }
      }),
      reaction(
          (_) => Modular.get<CadastrarMovimentacaoController>().categoriaStatus,
          (categoriaStatus) {
        switch (categoriaStatus) {
          case StoreState.loading:
            showLoader();
            break;
          case StoreState.loaded:
            hideLoader();
            _showInsertModal();
            break;
          case StoreState.error:
            hideLoader();
            break;
        }
      })
    ];
  }

  @override
  void dispose() {
    super.dispose();
    disposers.forEach((d) => d());
  }

  AppBar appBar = AppBar(
    title: Text(
      'Movimentações',
      key: Key('movimentacoes_title'),
      style: TextStyle(fontSize: 16),
    ),
    actions: <Widget>[
      PopupMenuButton<String>(
        onSelected: (item) async {
          Modular.get<CadastrarMovimentacaoController>().buscarCategorias(item);
        },
        icon: Icon(Icons.add),
        itemBuilder: (_) {
          return [
            PopupMenuItem<String>(
              value: 'receita',
              child: Text('Receita'),
            ),
            PopupMenuItem<String>(
              value: 'despesa',
              child: Text('Despesa'),
            )
          ];
        },
      ),
      IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () => {
          Modular.get<UsuarioRepository>().logout(),
          Get.offAllNamed('/login'),
        },
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.heigthScreen,
        child: Stack(
          children: <Widget>[
            Observer(
              builder: (_) {
                switch (controller.movimentacoesState) {
                  case StoreState.initial:
                  case StoreState.loading:
                    return Container(
                      height: SizeUtils.heigthScreen,
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                    break;
                  case StoreState.loaded:
                    return _makeContent();
                    break;
                  case StoreState.error:
                  default:
                    Get.snackbar('Erro ao buscar movimentações',
                        controller.errorMessage);
                    return Container();
                }
              },
            ),
            PainelSaldoWidget(
              appbarHeight: appBar.preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.heigthScreen * 0.1),
            child: ListView.separated(
                itemBuilder: (_, index) => MovimentacaoItem(
                      item: controller.movimentacoes[index],
                    ),
                separatorBuilder: (_, index) => Divider(
                      color: Colors.black,
                    ),
                itemCount: controller.movimentacoes?.length ?? 0),
          ),
        ),
      ],
    );
  }

  static _showInsertModal() {
    Modular.get<CadastrarMovimentacaoController>().limparValores();

    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      title: Text('Adicionar '),
      content: CadastrarMovimentacaoWidget(),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Get.back(result: false),
          child: const Text('Cancelar'),
        ),
        FlatButton(
          onPressed: () =>
              Modular.get<CadastrarMovimentacaoController>().salvarMovimento(),
          child: const Text('Salvar'),
        )
      ],
    ));
  }
}
