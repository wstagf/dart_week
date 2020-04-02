import 'package:dart_week_api/controllers/login_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class UsuariosRouter {
  static void configurar(Router router, ManagedContext context) {
    router.route('/login').link(() => LoginController(context));
  }
}
