class SessionTokenGenerator {
  static String uniqueId;
  static int token = 0;

  static getToken() {
    return token + 1;
  }
}
