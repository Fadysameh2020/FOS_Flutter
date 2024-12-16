
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fos_app/view/app_layout/cubit/app_cubit.dart';
import 'package:go_router/go_router.dart';

import 'core/app_localiziations/app_localizations.dart';
import 'core/app_router/routes.dart';
import 'core/bloc_helper/my_bloc_observer.dart';
import 'core/constants.dart';
import 'core/networks/local/cache_helper.dart';
import 'core/networks/local/secure_cache_helper.dart';
import 'core/networks/remote/dio_helper.dart';
import 'core/notification_helper/fcm_helper.dart';
import 'core/notification_helper/notification_service.dart';
import 'core/services/services_locator.dart';
import 'core/styles/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'dart:async';


List<Future<void>> futures = [
  SecureCacheHelper.init(),
  checkLoginStatus(),
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await NotificationsService.initializeNotifications();
  // FCMHelper.init();
  // FCMHelper.subscribeToTopic();
  // FCMHelper.onMessageListener();
  // FCMHelper.onBackgroundListener();

  // Use Future.wait to wait for all the futures to complete
  await Future.wait(futures);
  if (isLoggedIn) {
    // socketService.connect();
  }
  runApp(
    DevicePreview(
      enabled: /*!kReleaseMode*/ false,
      builder: (context) => MyApp(
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {

  const MyApp({super.key, });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<AppCubit>()
              ..getSavedLocale()
              ..getUserData()
          //..connectToSocket()
        ),
        // BlocProvider(create: (context) => sl<HomeCubit>()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = AppCubit.get(context);
          return ScreenUtilInit(
            builder: (context, child) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  for (var locale in supportedLocales) {
                    if (deviceLocale != null &&
                        deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                debugShowCheckedModeBanner: false,
                locale: cubit.locale == null ? null : Locale(cubit.locale!),
                color: Colors.white,
                theme: lightTheme,

              );
            },
          );
        },
      ),
    );
  }
}
