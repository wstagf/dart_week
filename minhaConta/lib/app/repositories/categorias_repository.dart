import '../core/custom_dio.dart';
import '../models/categoria_model.dart';

class CategoriaRepository {
  Future<List<CategoriaModel>> getCategorias(String tipo) {
    final dio = CustomDio.whithAutentication().instance;
    return dio.get('/categorias/$tipo').then((res) => res.data
        .map<CategoriaModel>((c) => CategoriaModel.fromMap(c))
        .toList());
  }
}
