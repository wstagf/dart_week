import 'package:mockito/mockito.dart';

import '../interfaces/usuario_repository_interface.dart';

class UsuarioRepositoryMock extends Mock implements IUsuarioRepository {
  Future<bool> isLogged() async {
    return true;
  }

  Future<bool> login(String login, String senha) async {
    return true;
  }

  Future<String> getToken() async {
    return ''' Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
    eyJleHAiOjE1ODc5MzI4NTgsImlhdCI6MTU4Nzg0NjQ1OCwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsInN1YiI6IjEifQ.
    99eiwaNPd2gd45MctJGPk4gdubfgPSmVsp8IaKSN4wA ''';
  }

  Future<void> logout();
  Future<void> cadastrarUsuaurio(String login, String senha);
}
