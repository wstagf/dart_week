mixin IUsuarioRepository {
  Future<bool> isLogged();
  Future<bool> login(String login, String senha);
  Future<String> getToken();
  Future<void> logout();
  Future<void> cadastrarUsuaurio(String login, String senha);
}
