import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../../components/controleja_text_form_field.dart';
import '../../../../utils/size_utils.dart';
import 'cadastrar_movimentacao_controller.dart';

class CadastrarMovimentacaoWidget extends StatelessWidget {
  final controller = Modular.get<CadastrarMovimentacaoController>();

  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Container(
              width: SizeUtils.widthScreen * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: SizeUtils.widthScreen,
                    color: Colors.grey[300],
                    child: Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            controller.setDataInclusao(date);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.dataInclusao == null
                                    ? 'Selecionar data'
                                    : DateFormat('d/MM/y')
                                        .format(controller.dataInclusao),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.heigthScreen * 0.02,
                  ),
                  Container(
                    decoration: !controller.categoriaValid
                        ? BoxDecoration(border: Border.all(color: Colors.red))
                        : null,
                    child: ListCombo(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(controller.categoria?.nome ?? 'Categoria'),
                      ),
                      getList: () => controller.categorias,
                      itemBuilder: (context, paramters, item) => ListTile(
                        title: Text(item.nome),
                      ),
                      onItemTapped: (item) {
                        controller.changeCategoria(item);
                      },
                    ),
                  ),
                  Visibility(
                    visible: !controller.categoriaValid,
                    child: Container(
                      width: SizeUtils.widthScreen,
                      padding: const EdgeInsets.only(top: 8.0, left: 14),
                      child: Text(
                        'Selecione uma categoria',
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeUtils.heigthScreen * 0.02,
                  ),
                  ControlejaTextFormField(
                    label: 'Descrição',
                    borderRadius: 5,
                    fontSize: 14,
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    onChanged: controller.changeDescricao,
                    validator: controller.validateDescricao,
                  ),
                  SizedBox(
                    height: SizeUtils.heigthScreen * 0.02,
                  ),
                  ControlejaTextFormField(
                    controller: controller.moneyController,
                    label: 'Valor',
                    borderRadius: 5,
                    fontSize: 14,
                    padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                    onChanged: controller.changeValor,
                    validator: controller.validateValor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
