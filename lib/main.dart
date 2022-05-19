// @dart=2.12
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// ignore: import_of_legacy_library_into_null_safe, unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'firebase_options.dart';
import 'service_locator.dart';
import 'splash_screen.dart';
import 'src/bindings/init_bindings.dart';
import 'src/configs/configs.dart';
import 'src/routes/route_const_str.dart';
import 'src/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get storage initialization
  await GetStorage.init('auth');
  await GetStorage.init('prefs');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // service locator initialization
  setUp();

  runApp(const MyApp(key: Key('muApp')));
}

mixin DefaultFirebaseOptions {
  // ignore: prefer_typing_uninitialized_variables
  static var currentPlatform;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RoutesPath.splashScreenRoute,
      getPages: Routes.getRoutes(),
      initialBinding: InitBindings(),
      title: 'La Nes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        canvasColor: primaryWhite,
        // primaryColor: primaryWhite,
      ),
      // home: DashboardPage(),
      // home: const AuthPage(),
      home: const SplashScreen(),
    );
  }
}
