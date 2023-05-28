import 'package:flutter/material.dart';
import 'package:hive_clean_arch/config/route/app_route.dart';
import 'package:hive_clean_arch/features/auth/ui/register/register_navigator.dart';

class LoginNavigator with RegisterViewRoute {
  @override
  late BuildContext context;
}

mixin loginViewRoute {
  openLoginViewRoute() {
    Navigator.pushNamed(
      context,
      AppRoute.loginRoute,
    );
  }

  BuildContext get context;
}
