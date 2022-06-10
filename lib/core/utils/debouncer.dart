part of utils;

/// [Debouncer] is used to prevent repeated calls to a method.
/// It will waits for a certain period of time and then the callback is called.
/// ///
/// use it:
/// ```
///   final _debouncer = Debouncer();
///
///  _debouncer.run(() {
///    Navigator.of(context).pop();
///  });
///
///   @override
///   void dispose() {
///     _debouncer.dispose();
///     super.dispose();
///   }
/// ```
///
class Debouncer {
  Timer? _timer;

  void run(
    VoidCallback onExecute, {
    int milliseconds = 300,
  }) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), onExecute);
  }

  void dispose() => _timer?.cancel();
}
