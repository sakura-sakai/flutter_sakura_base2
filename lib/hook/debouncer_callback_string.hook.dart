import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ValueChanged<String> useDebouncerCallbackString(
  ValueChanged<String> onExecute, {
  int milliseconds = 300,
}) {
  return use(
    _Debouncer(
      onExecute: onExecute,
      milliseconds: milliseconds,
    ),
  );
}

class _Debouncer extends Hook<ValueChanged<String>> {
  const _Debouncer({
    List<Object?>? keys,
    required this.onExecute,
    required this.milliseconds,
  }) : super(keys: keys);

  final ValueChanged<String> onExecute;
  final int milliseconds;

  @override
  HookState<ValueChanged<String>, _Debouncer> createState() =>
      _DebouncerState();
}

class _DebouncerState extends HookState<ValueChanged<String>, _Debouncer> {
  Timer? _timer;

  @override
  ValueChanged<String> build(BuildContext context) {
    return debounce;
  }

  void debounce(String data) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: hook.milliseconds),
      () => hook.onExecute(data),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
