import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:minhaConta/app/core/store_state.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:minhaConta/app/utils/size_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PainelSaldoWidget extends StatefulWidget {
  final double appbarHeight;

  const PainelSaldoWidget({Key key, this.appbarHeight}) : super(key: key);
  @override
  _PainelSaldoWidgetState createState() => _PainelSaldoWidgetState();
}

class _PainelSaldoWidgetState
    extends ModularState<PainelSaldoWidget, PainelSaldoController> {
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    super.initState();
    disposers ??= [
      reaction((_) => controller.data, (_) => controller.buscarTotalDoMes())
    ];

    controller.buscarTotalDoMes();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      elevation: 8,
      cornerRadius: 30,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [0.1, 0.4],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (_, state) {
        return Container(
          height: 5,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
      builder: (_, state) {
        return Observer(
          builder: (_) {
            switch (controller.totalState) {
              case StoreState.initial:
              case StoreState.loading:
                return Container(
                  height: SizeUtils.heigthScreen,
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                );
                break;
              case StoreState.loaded:
                return _makeContent();
                break;
              case StoreState.error:
                Get.snackbar(
                    'Erro ao buscar movimentações', controller.errorMessage);
                return Container();
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    disposers.forEach((d) => d());
  }

  Widget _makeContent() {
    var numberFormat = NumberFormat('##0.00', 'pt_BR');
    var model = controller.movimentacaoTotalModel;

    return Container(
      width: SizeUtils.widthScreen,
      height: (SizeUtils.heigthScreen * 0.4) - widget.appbarHeight,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => controller.mesAnterior(),
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  DateFormat.yMMMM('pt_BR').format(controller.data),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: model?.saldo != null && model.saldo < 0
                          ? Colors.red
                          : model?.saldo != null && model.saldo == 0
                              ? Colors.blue
                              : Colors.green),
                ),
                IconButton(
                  onPressed: () => controller.mesProximo(),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Column(
              children: <Widget>[
                Text('Saldo'),
                SizedBox(
                  height: SizeUtils.heigthScreen * 0.01,
                ),
                Text(
                  'R\$ ${model?.saldo != null ? numberFormat.format(model.saldo) : ' - '}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: model?.saldo != null && model.saldo < 0
                          ? Colors.red
                          : model?.saldo != null && model.saldo == 0
                              ? Colors.blue
                              : Colors.green),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF4BCE97),
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_upward),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Receitas',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF4BCE97),
                              ),
                            ),
                            Text(
                              'R\$ ${model?.receitas?.total != null ? numberFormat.format(model.receitas.total) : ' - '}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4BCE97),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.arrow_downward),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Despesas',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              'R\$ ${model?.despesas?.total != null ? numberFormat.format(model.despesas.total) : ' - '}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
