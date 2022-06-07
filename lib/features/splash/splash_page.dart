import 'package:flutter/material.dart';
import 'package:flutter_sakura_base2/core/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/constants.dart';
import '../../l10n/l10n_manager.dart';
import '../../theme/theme.dart';
import '../../widgets/stfuls/lazy_future_builder.dart';
import '../../widgets/stless/button/button.dart';
import '../../widgets/stless/text_view.dart';
import 'splash_view_model.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: AppColors.violet,
              highlightColor: AppColors.white,
              child: TextView(
                useL10n().appName,
                fontSize: FontSize.massive.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: kDefaultExThinPadding),
            FutureBuilder(
              future: ref.read(splashCtrlProvider).init(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return LazyFutureBuilder(
                    lazyFuture: () async {
                      await ref.read(splashCtrlProvider).init();
                    },
                    builder: (context, future, isFutureExecuting) {
                      if (isFutureExecuting == false) {
                        return Button(
                          useL10n().retry,
                          buttonType: ButtonType.accent,
                          onPressed: future,
                        );
                      }

                      return Container();
                    },
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
