import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';

class CategoriaRepository {
  CategoriaRepository(this.context);

  final ManagedContext context;

  Future<List<CategoriaModel>> buscarPorTipo(TipoCategoria tipoCategoria) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.tipoCategoria).equalTo(tipoCategoria);
    return query.fetch();
  }

  Future<CategoriaModel> buscarPorId(int id) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.id).equalTo(id);
    return query.fetchOne();
  }
}
