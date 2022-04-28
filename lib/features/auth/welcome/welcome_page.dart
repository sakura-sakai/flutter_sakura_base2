import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base2/core/utils/utils.dart';

import '../../../l10n/l10n_manager.dart';
import '../../../route/router.dart';
import '../../../theme/theme.dart';
import '../../../widgets/elements/assets_gen/assets.gen.dart';
import '../../../widgets/elements/assets_gen/fonts.gen.dart';
import '../../../widgets/elements/button/button.dart';
import '../../../widgets/elements/text_view.dart';

class WelcomePage extends HookWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(child: SizedBox(height: 3.h)),
              TextView(
                useL10n().welcome.toUpperCase(),
                fontSize: FontSize.massive,
                fontFamily: FontFamily.rotunda,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 3.h),
              Assets.svgs.chat.svg(
                height: 60.h,
              ),
              SizedBox(height: 3.h),
              SizedBox(
                width: 70.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Button(
                      useL10n().login.toUpperCase(),
                      buttonSize: ButtonSize.infinityWith,
                      onPressed: () {
                        AppRouter().push(const LoginRoute());
                      },
                    ),
                    SizedBox(height: 2.h),
                    Button(
                      useL10n().signUp.toUpperCase(),
                      buttonType: ButtonType.primaryLight,
                      buttonSize: ButtonSize.infinityWith,
                      onPressed: () {
                        AppRouter().push(const SignUpRoute());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends HookWidget {
  const _Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Assets.images.mainTop.image(
              width: 16.h,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Assets.images.mainBottom.image(
              width: 8.h,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
