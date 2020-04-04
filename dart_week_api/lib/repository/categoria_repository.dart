import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';

class CategoriaRepository {
  CategoriaRepository(this.context);

  final ManagedContext context;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(
      TipoCategoria tipoCategoria) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.tipoCategoria).equalTo(tipoCategoria);
    return query.fetch();
  }
}
