import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sgaintegral/src/controllers/home_controllers.dart';
import 'package:sgaintegral/src/routes/routes.dart';
import 'package:sgaintegral/src/services/notifications_service.dart';
import 'package:sgaintegral/src/utils/theme.dart';


void main() => runApp( MyApp());

class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final homeController = HomeController();
  @override
  void initState() {
       super.initState();
        WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeApp()),
             ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child:
      Consumer<ThemeApp>(builder: (_, valueTheme, __)
      {
        return  MaterialApp(
        title: 'Material App',
         debugShowCheckedModeBanner: false,
              //  CONFIGURACION PARA EL DATEPICKER
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'), // English, no country code
                Locale('es', 'ES'), // Hebrew, no country code
              ],
               //==== AGREGO EL TEMA ====//
            theme: valueTheme.themeData,
//============================//
            // initialRoute: 'prueba',

            initialRoute: 'login',

            routes: appRoutes,
            navigatorKey: homeController.navigatorKey,
            scaffoldMessengerKey: NotificatiosnService.messengerKey,
       
      );
    
      })
      
      
    
    );
  }
}