import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/services/other/network.dart';
import '../../l10n/l10n_manager.dart';
import '../../route/router.dart';

class ViewController extends ChangeNotifier with Network {
  ViewController(Reader read) : _read = read;

  final Reader _read;

  StackRouter get router => _read(routerProvider);

  BuildContext get context => _read(contextProvider);

  L10n get l10n => _read(l10nProvider);

  ExceptionHandler get _exception => _read(exceptionHandlerProvider);

  bool isDispose = false;

  void updateState() {
    if (!isDispose) notifyListeners();
  }

  void handleExceptions(dynamic e) => _exception.handler(e);

  @override
  void dispose() {
    isDispose = true;
    super.dispose();
  }
}
