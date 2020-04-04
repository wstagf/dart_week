import 'package:dart_week_api/config/jwt_autenticate.dart';
import 'package:dart_week_api/controllers/categorias/categorias_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class CategoriaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/categorias/:tipo')
        .link(() => JwtAutentication(context))
        .link(() => CategoriasController(context));
  }
}
