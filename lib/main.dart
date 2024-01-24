import 'package:breakingbad/app_router.dart';
import 'package:breakingbad/initialize_main_services_locator.dart';
import 'package:flutter/material.dart';
import 'initialize_main_firebase_services.dart';

Future<void> main() async {
  await initializeMainServicesLocator();
  await initializeMainFirebaseServices();
  runApp(BreakingBad(appRouter: AppRouter()));
}

class BreakingBad extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBad({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute);
  }
}
