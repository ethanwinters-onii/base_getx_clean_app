import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/core/base/main_layout.dart';
import 'package:getx_clean_architecture/core/values/constants.dart';
import 'package:getx_clean_architecture/features/authentication/presentation/controllers/authentication_controller.dart';
import 'package:getx_clean_architecture/features/authentication/presentation/widgets/login_text_field.dart';
import 'package:getx_clean_architecture/generated/assets.gen.dart';
import 'package:getx_clean_architecture/generated/locales.g.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout<AuthenticationController>(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    controller.changeLocale(LanguageCodeConstant.VI);
                  },
                  child: Assets.icons.vietnam.svg(height: 32),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    controller.changeLocale(LanguageCodeConstant.EN);
                  },
                  child: Assets.icons.united.svg(height: 32),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {
                    controller.changeLocale(LanguageCodeConstant.CN);
                  },
                  child: Assets.icons.china.svg(height: 32),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.defaultUser
                    .image(width: double.infinity, height: 100),
                const SizedBox(
                  height: 32,
                ),
                LoginTextField(
                  editingController: controller.usernameEditingController,
                  hintText: 'Username',
                  onValidator: (s) {},
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 10,
                ),
                LoginTextField(
                  editingController: controller.passwordEditingController,
                  hintText: 'Password',
                  onValidator: (s) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFF78361), Color(0xFFF54B64)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: Colors.white.withOpacity(0.5),
                      onTap: () {
                        controller.handleSignIn();
                      },
                      child: Center(
                        child: Text(
                          LocaleKeys.buttons_login.tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
