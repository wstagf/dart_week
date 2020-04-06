import 'package:flutter/material.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/movimentacao_item.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/painel_saldo/painel_saldo_widget.dart';
import 'package:minhaConta/app/utils/size_utils.dart';

class MovimentacoesPage extends StatefulWidget {
  const MovimentacoesPage({Key key}) : super(key: key);

  @override
  _MovimentacoesPageState createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState extends State<MovimentacoesPage> {
  AppBar appBar = AppBar(
    title: Text('Movimentações'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.heigthScreen,
        child: Stack(
          children: <Widget>[
            _makeContent(),
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
          child: ListView.separated(
              itemBuilder: (_, index) => MovimentacaoItem(),
              separatorBuilder: (_, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: 10),
        ),
      ],
    );
  }
}
