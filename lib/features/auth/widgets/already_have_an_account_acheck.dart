import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../l10n/l10n_manager.dart';
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
              ? useL10n().doNotHaveAnAccount
              : useL10n().alreadyHaveAnAccount,
          fontColor: AppColors.violet,
        ),
        GestureDetector(
          onTap: onTap,
          child: TextView(
            isLogin ? useL10n().signUp : useL10n().signIn,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.violet,
          ),
        )
      ],
    );
  }
}
