part of api_config;

///
/// Store url config
///
class StoreUrlConfig {
  StoreUrlConfig._(this.url);

  factory StoreUrlConfig(String url) {
    return _instance ??= StoreUrlConfig._(url);
  }

  static StoreUrlConfig? _instance;

  static StoreUrlConfig get instance => _instance!;

  String url;
}
