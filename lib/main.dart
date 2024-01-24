import 'package:breakingbad/app_router.dart';
import 'package:breakingbad/initialize_main_services_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initializeMainServicesLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BreakingBad(appRouter: AppRouter()));
}

class BreakingBad extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBad({super.key,  required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute);
  }
}
