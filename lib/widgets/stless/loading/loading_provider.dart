import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../route/router.dart';
import 'indicator.dart';

final loadingProvider = Provider(
  (ref) => LoadingProvider(ref.read),
);

class LoadingProvider {
  LoadingProvider(Reader read) : _read = read;

  final Reader _read;

  BuildContext get _context => _read(contextProvider);

  bool isShowLoading = false;

  void show() {
    if (isShowLoading) return;
    isShowLoading = true;
    _showLoading(_context);
  }

  void hide() {
    if (!isShowLoading) return;
    isShowLoading = false;
    _hideLoading();
  }

  Future<void> _showLoading(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: Indicator(radius: 14.0, color: IndicatorColor.white),
          ),
        );
      },
    );
  }

  void _hideLoading() => AppRouter().popForced();
}
