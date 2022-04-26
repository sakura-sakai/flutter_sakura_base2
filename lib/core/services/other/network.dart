import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

mixin Network {
  ///
  /// Online / offline
  ///
  @protected
  Future<bool> isOnline() async {
    final connectivity = await Connectivity().checkConnectivity();

    switch (connectivity) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
        return true;

      case ConnectivityResult.none:
      default:
        return false;
    }
  }
}
