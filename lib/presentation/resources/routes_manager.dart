import 'package:advanced_course/presentation/forgot_password/forgot_password.dart';
import 'package:advanced_course/presentation/login/login.dart';
import 'package:advanced_course/presentation/register/register.dart';
import 'package:advanced_course/presentation/resources/strings_manager.dart';
import 'package:advanced_course/presentation/splash/splash.dart';

import 'package:flutter/material.dart';

import '../main/main_view.dart';
import '../onboarding/onboarding.dart';
import '../store_details/store_details.dart';



class Routes{
  static const String splashRoute="/";
  static const String onBoardingRoute="/onboarding";
  static const String loginRoute="/login";
  static const String registerRoute="/register";
  static const String forgetPasswordRoute="/forgetPassword";
  static const String mainRoute="/main";
  static const String storeDetailsRoute = "/storeDetails";

}

class RouteGenerator{

  static Route getRoute(RouteSettings routeSettings){


    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const StoreDetailsView());

      default:
        return unDefinedRoute();

    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
        Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noRouteFound)),
          body: const Center(
            child: Text(AppStrings.noRouteFound) ,
          ),
    )
    );
    
  }
}


