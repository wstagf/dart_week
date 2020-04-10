import 'package:minhaConta/app/core/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  Future<bool> isLogged() async {
    final String token = await this.getToken();
    return token != null;
  }

  Future<bool> login(String login, String senha) {
    final dio = CustomDio().instance;

    return dio.post('/login', data: {'login': login, 'senha': senha}).then(
        (res) async {
      final String token = res.data['token'];
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return true;
      }

      return false;
    });
  }

  Future<String> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
