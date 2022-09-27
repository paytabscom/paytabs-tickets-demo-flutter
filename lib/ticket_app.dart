import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/presentation/router/router_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/router/app_router.dart';
import '../domain/ext.dart';
import 'presentation/styles/app_colors.dart';

class TicketApp extends ConsumerWidget {
  const TicketApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      onGenerateRoute: AppRouter.getRoute,
      initialRoute: RouterNames.mainRoute,
      title: 'Ticket App',
      theme: ref.theme,
    );
  }
}
