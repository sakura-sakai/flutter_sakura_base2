import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useDebouncer(VoidCallback onExecute, {int milliseconds = 300}) {
  return use(
    _Debouncer(
      milliseconds: milliseconds,
      onExecute: onExecute,
    ),
  );
}

class _Debouncer extends Hook<void> {
  const _Debouncer({
    List<Object?>? keys,
    required this.milliseconds,
    required this.onExecute,
  }) : super(keys: keys);

  final int milliseconds;
  final VoidCallback onExecute;

  @override
  HookState<void, _Debouncer> createState() => _DebouncerState();
}

class _DebouncerState extends HookState<void, _Debouncer> {
  Timer? _timer;

  @override
  void build(BuildContext context) => debounce();

  void debounce() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(
      Duration(milliseconds: hook.milliseconds),
      hook.onExecute,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}
