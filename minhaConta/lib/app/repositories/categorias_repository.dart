import '../core/custom_dio.dart';
import '../models/categoria_model.dart';
import 'interfaces/categorias_repository_interface.dart';

class CategoriaRepository implements ICategoriasRepository {
  Future<List<CategoriaModel>> getCategorias(String tipo) {
    final dio = CustomDio.whithAutentication().instance;
    return dio.get('/categorias/$tipo').then(
        (res) => res.data.map<CategoriaModel>(CategoriaModel.fromMap).toList());
  }
}
