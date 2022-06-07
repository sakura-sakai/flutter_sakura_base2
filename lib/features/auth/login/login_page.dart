import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/const/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../l10n/l10n_manager.dart';
import '../../../route/router.dart';
import '../../../theme/theme.dart';
import '../../../widgets/stless/assets_gen/assets.gen.dart';
import '../../../widgets/stless/assets_gen/fonts.gen.dart';
import '../../../widgets/stless/button/button.dart';
import '../../../widgets/stless/text_area/obscure_text_area.dart';
import '../../../widgets/stless/text_area/text_area.dart';
import '../../../widgets/stless/text_view.dart';
import '../auth_view_model.dart';
import '../widgets/already_have_an_account_acheck.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = useMemoized(GlobalKey<FormState>.new);
    final viewModel = ref.read(authVMProvider);

    return Scaffold(
      body: _Background(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SafeArea(child: SizedBox(height: 3.h)),
              TextView(
                useL10n().login.toUpperCase(),
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
                        onSaved: (value) => viewModel.email = value ?? '',
                        hintText: useL10n().email,
                        labelText: useL10n().email,
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
                        onSaved: (value) => viewModel.password = value ?? '',
                        hintText: useL10n().password,
                        labelText: useL10n().password,
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
                        useL10n().login.toUpperCase(),
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
