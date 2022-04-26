part of env_service;

class EnvManager {
  static Future<void> ensureInitialized() async {
    await _loadEnv();
    await _configBaseUrl();
    await _configApiKey();
    await _configStoreUrl();
    await _configFlavor();
  }

  /// Get the configuration file for each environment
  static Future<void> _loadEnv() async {
    const String env = bool.hasEnvironment(kEnv)
        ? '.env/.env.' + String.fromEnvironment(kEnv)
        : '.env/.env.dev';

    await dotenv.load(fileName: env);
  }

  /// Base URL
  static Future<void> _configBaseUrl() async {
    final baseUrl = const bool.hasEnvironment(kBaseUrlEnv)
        ? const String.fromEnvironment(kBaseUrlEnv)
        : dotenv.env[kBaseUrlEnv];

    BasePathConfig(url: baseUrl);
  }

  /// Api key
  static Future<void> _configApiKey() async {
    final apiKey = const bool.hasEnvironment(kApiKeyEnv)
        ? const String.fromEnvironment(kApiKeyEnv)
        : dotenv.env[kApiKeyEnv];

    ApiKeyConfig(apiKey ?? '');
  }

  /// URL of application distribution (* for each platform)
  static Future<void> _configStoreUrl() async {
    if (kIsWeb) {
      return;
    }

    final storeUrl = Platform.isAndroid
        ? dotenv.env[kGooglePlayStoreUrl]
        : dotenv.env[kAppStoreUrl];

    StoreUrlConfig(storeUrl ?? '');
  }

  /// Flavor
  static Future<void> _configFlavor() async {
    /// App banner color
    final bannerColor = int.tryParse(dotenv.env[kDebugBannerColorEnv] ?? '0');

    /// App banner (environmental judgment) settings
    FlavorConfig(
      name: dotenv.env[kDebugBannerTitleEnv] ?? '',
      color: Color(bannerColor ?? AppColors.violet.value),
      location: BannerLocation.bottomStart,
    );
  }
}
