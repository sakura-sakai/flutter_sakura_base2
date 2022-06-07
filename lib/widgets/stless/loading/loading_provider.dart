import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../route/router.dart';
import 'indicator.dart';

final loadingProvider = StateNotifierProvider<LoadingProvider, bool>(
  (ref) => LoadingProvider(ref.read),
);

class LoadingProvider extends StateNotifier<bool> {
  LoadingProvider(Reader read)
      : _read = read,
        super(false);

  final Reader _read;

  BuildContext get _context => _read(contextProvider);

  void show() {
    if (state) return;
    state = true;
    _showLoading(_context);
  }

  void hide() {
    if (!state) return;
    state = false;
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
