// ignore_for_file: unreachable_switch_case

import 'package:advanced_flutter_tutorial/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/forgetpassword/forget_password_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/login/login_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/main/main_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/onboarding/view/onboarding_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/register/register_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/splash/splash_view.dart';
import 'package:advanced_flutter_tutorial/presentation/routes/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onboardingRoute = "/onboarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );

      // > login
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );

      // > register
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      // > forgetpw
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
        );

      // > mainRoute
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );

      // > onboarding
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );

      // > storeDetailsRoute
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const StoreDetailsView(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(AppStrings.noRouteDefined),
        ),
        body: const Center(
          child: Text(AppStrings.routeNotDefined),
        ),
      ),
    );
  }
}
