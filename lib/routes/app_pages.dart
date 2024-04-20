import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/features/authentication/presentation/bindings/authentication_binding.dart';
import 'package:getx_clean_architecture/features/authentication/presentation/views/authentication_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
  ];
}
