import 'package:mockito/mockito.dart';

import '../../models/categoria_model.dart';
import '../interfaces/categorias_repository_interface.dart';

class CategoriasRepositoryMock extends Mock implements ICategoriasRepository {
  Future<List<CategoriaModel>> getCategorias(String tipo) async {
    final ret = [];

    if (tipo == 'receita') {
      ret.add(CategoriaModel.fromMap({"id": 1, "nome": "Salário"}));
      ret.add(CategoriaModel.fromMap({"id": 2, "nome": "Investimento"}));
      ret.add(CategoriaModel.fromMap({"id": 3, "nome": "Aplicação"}));
    }
    if (tipo == 'despesa') {
      ret.add(CategoriaModel.fromMap({"id": 4, "nome": "Contas Residenciais"}));
      ret.add(CategoriaModel.fromMap({"id": 5, "nome": "Educação"}));
      ret.add(CategoriaModel.fromMap({"id": 6, "nome": "Mercado"}));
      ret.add(CategoriaModel.fromMap({"id": 7, "nome": "Saúde"}));
      ret.add(CategoriaModel.fromMap({"id": 8, "nome": "Transporte"}));
      ret.add(CategoriaModel.fromMap({"id": 9, "nome": "Compras"}));
      ret.add(CategoriaModel.fromMap({"id": 10, "nome": "Bar / Restaurantes"}));
    }

    return ret.toList();
  }
}
