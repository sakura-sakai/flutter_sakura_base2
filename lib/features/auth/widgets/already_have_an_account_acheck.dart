import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../language/locale_keys.g.dart';
import '../../../theme/theme.dart';
import '../../../widgets/elements/text_view.dart';

class AlreadyHaveAnAccountCheck extends HookWidget {
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.isLogin = true,
    this.onTap,
  }) : super(key: key);

  final bool isLogin;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextView(
          isLogin
              ? LocaleKeys.doNotHaveAnAccount.tr()
              : LocaleKeys.alreadyHaveAnAccount.tr(),
          fontColor: AppColors.violet,
        ),
        GestureDetector(
          onTap: onTap,
          child: TextView(
            isLogin ? LocaleKeys.signUp.tr() : LocaleKeys.signIn.tr(),
            fontWeight: FontWeight.bold,
            fontColor: AppColors.violet,
          ),
        )
      ],
    );
  }
}
