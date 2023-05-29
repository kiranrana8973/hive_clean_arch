import '../../features/auth/ui/login/login_view.dart';
import '../../features/auth/ui/register/register_view.dart';
import '../../features/home/ui/dashboard.dart';
import '../../features/splash/ui/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const RegisterView(),
    };
  }
}
