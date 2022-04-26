import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../language/locale_keys.g.dart';
import '../../../route/router.dart';
import '../../../theme/theme.dart';
import '../../../widgets/elements/assets_gen/assets.gen.dart';
import '../../../widgets/elements/assets_gen/fonts.gen.dart';
import '../../../widgets/elements/button/button.dart';
import '../../../widgets/elements/text_area/obscure_text_area.dart';
import '../../../widgets/elements/text_area/text_area.dart';
import '../../../widgets/elements/text_view.dart';
import '../auth_controller.dart';
import '../widgets/already_have_an_account_acheck.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = useMemoized(GlobalKey<FormState>.new);
    final viewCtrl = ref.read(authCtrlProvider);

    return Scaffold(
      body: _Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(child: SizedBox(height: 3.h)),
              TextView(
                LocaleKeys.login.tr().toUpperCase(),
                fontSize: FontSize.massive,
                fontFamily: FontFamily.rotunda,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              Assets.svgs.login.svg(height: 35.h),
              SizedBox(height: 3.h),
              SizedBox(
                width: 70.w,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextArea(
                        onSaved: (value) => viewCtrl.email = value ?? '',
                        hintText: LocaleKeys.email.tr(),
                        labelText: LocaleKeys.email.tr(),
                        isRequired: true,
                        textLightColor: AppColors.violet,
                        textType: TextType.email,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        borderRadius: 26,
                        filled: true,
                        fillColor: AppColors.violet[50],
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                          ),
                          child: Icon(
                            Icons.person,
                            color: AppColors.violet,
                            size: kWideIconSize,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      ObscureTextArea(
                        onSaved: (value) => viewCtrl.password = value ?? '',
                        hintText: LocaleKeys.password.tr(),
                        labelText: LocaleKeys.password.tr(),
                        isRequired: true,
                        textLightColor: AppColors.violet,
                        textType: TextType.password,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        borderRadius: 26,
                        filled: true,
                        fillColor: AppColors.violet[50],
                        textInputAction: TextInputAction.done,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                          ),
                          child: Icon(
                            Icons.lock,
                            color: AppColors.violet,
                            size: kWideIconSize,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      LoadingButton(
                        LocaleKeys.login.tr().toUpperCase(),
                        buttonType: ButtonType.primaryLight,
                        buttonSize: ButtonSize.infinityWith,
                        onPressed: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          AppRouter().replaceAll(const [HomeRoute()]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              AlreadyHaveAnAccountCheck(
                isLogin: true,
                onTap: () {
                  AppRouter().replace(const SignUpRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Widget child;

  const _Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Assets.images.mainTop.image(width: 30.w),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Assets.images.loginBottom.image(width: 30.w),
          ),
          child,
        ],
      ),
    );
  }
}
