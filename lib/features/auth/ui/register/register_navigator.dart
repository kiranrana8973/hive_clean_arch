import 'package:flutter/material.dart';
import 'package:hive_clean_arch/features/auth/ui/login/login_navigator.dart';

import '../../../../config/route/app_route.dart';

class RegisterNavigator with loginViewRoute {
  @override
  late BuildContext context;
}

mixin RegisterViewRoute {
  openRegisterViewRoute() {
    Navigator.pushNamed(
      context,
      AppRoute.registerRoute,
    );
  }

  BuildContext get context;
}
