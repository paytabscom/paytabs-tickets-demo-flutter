import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/models/event.dart';
import '../event_details/event_details_screen.dart';
import '../styles/app_colors.dart';
import '../main/main_screen.dart';
import '../payment/payment_screen.dart';
import 'router_names.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RouterNames.eventDetailsRoute:
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ));
        return MaterialPageRoute(
          builder: (_) => EventDetailsScreen(
            event: settings.arguments as Event,
          ),
        );
      case RouterNames.eventDetailsRoute:
        return MaterialPageRoute(
            builder: (_) =>
                EventDetailsScreen(event: settings.arguments as Event));
      case RouterNames.paymentRoute:
        return MaterialPageRoute(
            builder: (_) => PaymentScreen(event: settings.arguments as Event));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('noRouteFound')),
        body: const Center(child: Text('noRouteFound')),
      ),
    );
  }
}
