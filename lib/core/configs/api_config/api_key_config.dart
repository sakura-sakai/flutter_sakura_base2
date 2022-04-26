class ApiKeyConfig {
  ApiKeyConfig._(this.key);

  static ApiKeyConfig? _instance;

  factory ApiKeyConfig(String key) => _instance ??= ApiKeyConfig._(key);

  static ApiKeyConfig get instance => _instance!;

  final String key;
}
