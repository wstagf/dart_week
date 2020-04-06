import 'package:flutter/material.dart';
import 'package:minhaConta/app/modules/movimentacoes/components/movimentacao_item.dart';
import 'package:minhaConta/app/utils/size_utils.dart';

class MovimentacoesPage extends StatefulWidget {
  final String title;
  const MovimentacoesPage({Key key, this.title = "Movimentacoes"})
      : super(key: key);

  @override
  _MovimentacoesPageState createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState extends State<MovimentacoesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: SizeUtils.heigthScreen,
        child: Stack(
          children: <Widget>[
            _makeContent(),
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
