import 'package:flutter/material.dart';

import '../../../config/route/app_route.dart';

class HomeNavigator {}

mixin HomeViewRoute {
  openHomeRoute() {
    Navigator.pushNamed(
      context,
      AppRoute.homeRoute,
    );
  }

  BuildContext get context;
}
