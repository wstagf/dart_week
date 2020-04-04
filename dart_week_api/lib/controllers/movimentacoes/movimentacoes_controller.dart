import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/usuario_model.dart';
import 'package:dart_week_api/services/movimentacoes_service.dart';
import 'package:intl/intl.dart';

class MovimentacoesController extends ResourceController {
  MovimentacoesController(this.context)
      : service = MovimentacoesService(context);

  final ManagedContext context;
  final MovimentacoesService service;

  @Operation.get('anoMes')
  Future<Response> buscarTodasMovimentacoes() {
    final anoMes = request.path.variables['anoMes'];
    final DateFormat dateFormat = DateFormat('yyy-MM-dd');
    final UsuarioModel usuario = request.attachments['usuario'] as UsuarioModel;

    return service.buscarMovimentacoes(usuario, anoMes).then((data) {
      return data
          .map((m) => {
                'id': m.id,
                'dataMovimentacao': dateFormat.format(m.dataMovimentacao),
                'descricao': m.descricao,
                'valor': m.valor,
                'categoria': {
                  'id': m.categoria.id,
                  'nome': m.categoria.nome,
                  'tipo': m.categoria.tipoCategoria.toString().split('.')[1]
                }
              })
          .toList();
    }).then((lista) => Response.ok(lista));
  }
}
