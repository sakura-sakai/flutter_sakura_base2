import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/view_controller/view_controller.dart';
import '../../route/router.dart';

final splashCtrlProvider = Provider.autoDispose<SplashController>(
  (ref) => SplashController(ref.read),
);

class SplashController extends ViewController {
  SplashController(Reader read) : super(read);

  Future<void> init() async {
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        router.replace(const WelcomeRoute());
      });
    } catch (e) {
      handleExceptions(e);

      throw Exception('There is a fatal error');
    }
  }
}
