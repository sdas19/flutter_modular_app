class ServerLoginManager {
  ServerLoginManager._();

  static final ServerLoginManager instance = ServerLoginManager._();

  String login(String username, String password) => "Servered $username";
}
