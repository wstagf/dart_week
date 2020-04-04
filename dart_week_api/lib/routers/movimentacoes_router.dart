import 'package:dart_week_api/config/jwt_autenticate.dart';
import 'package:dart_week_api/controllers/movimentacoes/movimentacoes_controller.dart';

import '../dart_week_api.dart';

class MovimentacoesRouter {
  static void configurar(Router router, ManagedContext context) {
    router
        .route('/movimentacoes/:anoMes')
        .link(() => JwtAutentication(context))
        .link(() => MovimentacoesController(context));

    router
        .route('/movimentacoes/total/:totalAnoMes')
        .link(() => JwtAutentication(context))
        .link(() => MovimentacoesController(context));

    router
        .route('/movimentacoes/')
        .link(() => JwtAutentication(context))
        .link(() => MovimentacoesController(context));
  }
}
