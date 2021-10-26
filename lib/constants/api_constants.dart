class ApiConstants {
  static const String BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "http://192.168.2.105:8080/");

  static const int RESULTS_LIMIT = 25;
}
