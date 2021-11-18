class AuthException implements Exception {
  final String key;

  static const Map<String, String> errors = {"": ""};

  AuthException(this.key);

  @override
  String toString() {
    return super.toString();
  }
}
