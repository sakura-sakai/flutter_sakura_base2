part of api_config;

///
/// Base path configs
///
class BasePathConfig {
  BasePathConfig._(
    String subDomain,
    String url,
  )   : _subDomain = subDomain,
        _url = url;

  factory BasePathConfig({
    String? subDomain,
    String? url,
  }) {
    return _instance ??= BasePathConfig._(
      subDomain ?? '',
      url ?? '',
    );
  }

  static BasePathConfig? _instance;

  static BasePathConfig get instance => _instance!;

  String _subDomain;
  String _url;

  // ignore: avoid_setters_without_getters
  set subDomain(String value) => _subDomain = value;

  // ignore: avoid_setters_without_getters
  set url(String value) => _url = value;

  String get basePath {
    if (_subDomain.isEmpty) {
      return _url;
    }

    return _url.replaceAll('{target}', _subDomain);
  }
}
