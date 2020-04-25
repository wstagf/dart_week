import '../../models/categoria_model.dart';

mixin ICategoriasRepository {
  Future<List<CategoriaModel>> getCategorias(String tipo);
}
