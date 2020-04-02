import 'package:dart_week_api/controllers/login/dto/login_request.dart';

import '../../dart_week_api.dart';

class LoginController extends ResourceController {
  LoginController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> login(@Bind.body() LoginRequest request) async {
    print(request.asMap());
    return Response.ok({});
  }
}
