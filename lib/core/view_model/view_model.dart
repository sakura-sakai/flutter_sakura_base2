import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../l10n/l10n_manager.dart';
import '../../route/router.dart';
import '../../widgets/stless/loading/loading_provider.dart';
import '../services/other/network.dart';

abstract class ViewModel extends ChangeNotifier with Network {
  ViewModel(Reader read) : _read = read;

  final Reader _read;

  LoadingProvider get loadingState => _read(loadingProvider.notifier);

  StackRouter get router => _read(routerProvider);

  BuildContext get context => _read(contextProvider);

  L10n get l10n => _read(l10nProvider);

  ExceptionHandler get _exception => _read(exceptionHandlerProvider);

  bool isDisposed = false;

  /// This is a method of [ChangeNotifier] class
  ///
  /// Discards any resources used by the object. After this is called, the
  /// object is not in a usable state and should be discarded (calls to
  /// [addListener] and [removeListener] will throw after the object is
  /// disposed).
  ///
  /// This method should only be called by the object's owner.
  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  /// [handleExceptions] is a method that helps you analyze
  /// and handle possible errors at [ViewModel].
  ///
  /// So Please call it in [catch] method.
  void handleExceptions(dynamic e) => _exception.handler(e);

  /// [updateState] the same as [notifyListeners] of [ChangeNotifier].
  ///
  /// But it won't call [notifyListeners] if [isDisposed] = true.
  /// So please call [updateState] instead of [notifyListeners].
  void updateState() {
    if (isDisposed) {
      assert(throw Exception('ViewModel Disposed'));
      return;
    }

    notifyListeners();
  }
}
