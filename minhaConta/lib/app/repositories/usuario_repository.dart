import 'package:shared_preferences/shared_preferences.dart';

import '../core/custom_dio.dart';
import 'interfaces/usuario_repository_interface.dart';

class UsuarioRepository implements IUsuarioRepository {
  Future<bool> isLogged() async {
    final token = await getToken();
    return token != null;
  }

  Future<bool> login(String login, String senha) {
    final dio = CustomDio().instance;

    return dio.post('/login', data: {'login': login, 'senha': senha}).then(
        (res) async {
      final String token = res.data['token'];
      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return true;
      }

      return false;
    });
  }

  Future<String> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> cadastrarUsuaurio(String login, String senha) async {
    final dio = CustomDio().instance;
    return dio.post(
      '/usuario',
      data: {'login': login, 'senha': senha},
    );
  }
}
