import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/services/categoria_service.dart';

class CategoriasController extends ResourceController {
  CategoriasController(this.context) : service = CategoriaService(context);

  final ManagedContext context;
  final CategoriaService service;

  @Operation.get('tipo')
  Future<Response> buscarCategoriasPorTipo() {
    final tipo = request.path.variables['tipo'];
    final tipoCategoria = TipoCategoria.values
        .firstWhere((t) => t.toString().split('.').last == tipo);

    return service
        .buscarCategoriaPorTipo(tipoCategoria)
        .then((result) =>
            result.map((c) => {'id': c.id, 'nome': c.nome}).toList())
        .then((data) => Response.ok(data));
  }
}
