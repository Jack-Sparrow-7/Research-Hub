import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:research_hub/firebase services/auth_check.dart';
import 'package:research_hub/repository/cubit/notification_cubit.dart';
import 'package:research_hub/repository/home data/bloc/home_data_bloc.dart';
import 'package:research_hub/responsive/device_info_service.dart';
import 'package:research_hub/repository/authentication/bloc/auth_bloc.dart';
import 'package:research_hub/repository/cubit/hide_text_cubit.dart';
import 'package:research_hub/repository/cubit/page_index_cubit.dart';
import 'package:research_hub/screen%20routes/screen_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceInfoService.init(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    final isDesktop = DeviceInfoService.isDesktop;
    final isTablet = DeviceInfoService.isTablet;

    if (!kIsWeb) {
      if (isDesktop) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      }
    }

    Size getDesignSize() {
      if (isDesktop) {
        return const Size(1728, 1117);
      } else if (isTablet) {
        return const Size(1024, 1366);
      } else {
        return const Size(440, 956);
      }
    }

    return ScreenUtilInit(
      designSize: getDesignSize(),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => HideTextCubit()),
            BlocProvider(create: (_) => AuthBloc()),
            BlocProvider(create: (_) => PageIndexCubit()),
            BlocProvider(create: (_) => NotificationCubit()),
            BlocProvider(
              create:
                  (_) =>
                      HomeDataBloc(FirebaseFirestore.instance)
                        ..add(FetchHomeData()),
            ),
          ],
          child: GetMaterialApp(
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.blue,
                selectionColor: Colors.blue.shade100,
                selectionHandleColor: Colors.blue,
              ),
            ),
            getPages: screenRoutes(),
            home: const AuthCheck(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
