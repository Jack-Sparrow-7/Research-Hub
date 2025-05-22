import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:research_hub/core/constants/color_pallete.dart';
import 'package:research_hub/core/responsive/device_info_service.dart';
import 'package:research_hub/core/screen%20routes/screen_routes.dart';
import 'package:research_hub/features/auth/data/data%20sources/firebase_auth_source.dart';
import 'package:research_hub/features/auth/data/repositories/user_repository_impl.dart';
import 'package:research_hub/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:research_hub/features/auth/domain/usecases/login_usecase.dart';
import 'package:research_hub/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:research_hub/features/auth/presentation/bloc/forgot_password_bloc.dart';
import 'package:research_hub/features/auth/presentation/screens/login%20screen/login_screen.dart';
import 'package:research_hub/features/explore/data/data%20source/explore_data_source.dart';
import 'package:research_hub/features/explore/data/repositories/explore_repository_impl.dart';
import 'package:research_hub/features/explore/domain/usecases/get_categories_usecase.dart';
import 'package:research_hub/features/explore/presentation/bloc/explore_bloc.dart';
import 'package:research_hub/features/home/data/data%20source/home_data_source.dart';
import 'package:research_hub/features/home/data/repositories/home_repositories_impl.dart';
import 'package:research_hub/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:research_hub/features/home/presentation/bloc/home_data_bloc.dart';
import 'package:research_hub/features/profile/data/data%20source/profile_data_source.dart';
import 'package:research_hub/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:research_hub/features/profile/domain/usecases/change_password_usecase.dart';
import 'package:research_hub/features/profile/domain/usecases/logout_usecase.dart';
import 'package:research_hub/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:research_hub/features/profile/presentation/cubit/notification_cubit.dart';
import 'package:research_hub/main%20screen/cubit/page_index_cubit.dart';
import 'package:research_hub/features/projects/data/data%20source/project_data_source.dart';
import 'package:research_hub/features/projects/data/repositories/project_repository_impl.dart';
import 'package:research_hub/features/projects/domain/usecases/get_projects_usecase.dart';
import 'package:research_hub/features/projects/presentation/bloc/project_bloc.dart';
import 'package:research_hub/main%20screen/main_screen.dart';

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

    final isTablet = DeviceInfoService.isTablet;
    final isMobile = DeviceInfoService.isMobile;

    Size getDesignSize() {
      if (isMobile) {
        return const Size(440, 956);
      } else if (isTablet) {
        return const Size(1024, 1366);
      } else {
        return const Size(1728, 1117);
      }
    }

    return ScreenUtilInit(
      designSize: getDesignSize(),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => AuthBloc(
                  LoginUsecase(
                    userRepository: UserRepositoryImpl(
                      firebaseAuthSource: FirebaseAuthSource(
                        firebaseAuth: FirebaseAuth.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => ForgotPasswordBloc(
                  ForgotPasswordUsecase(
                    userRepository: UserRepositoryImpl(
                      firebaseAuthSource: FirebaseAuthSource(
                        firebaseAuth: FirebaseAuth.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(create: (context) => PageIndexCubit()),
          BlocProvider(
            create:
                (context) => HomeDataBloc(
                  GetHomeDataUsecase(
                    homeRepository: HomeRepositoriesImpl(
                      homeDataSource: HomeDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(create: (context) => NotificationCubit()),
          BlocProvider(
            create:
                (context) => ProfileBloc(
                  LogoutUsecase(
                    profileRepository: ProfileRepositoryImpl(
                      profileDataSource: ProfileDataSource(
                        firebaseAuth: FirebaseAuth.instance,
                      ),
                    ),
                  ),
                  ChangePasswordUsecase(
                    profileRepository: ProfileRepositoryImpl(
                      profileDataSource: ProfileDataSource(
                        firebaseAuth: FirebaseAuth.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => ExploreBloc(
                  GetCategoriesUsecase(
                    exploreRepository: ExploreRepositoryImpl(
                      exploreDataSource: ExploreDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                ),
          ),
          BlocProvider(
            create:
                (context) => ProjectBloc(
                  GetProjectsUsecase(
                    projectRepository: ProjectRepositoryImpl(
                      projectDataSource: ProjectDataSource(
                        firestore: FirebaseFirestore.instance,
                      ),
                    ),
                  ),
                )..add(FetchProjects()),
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
          debugShowCheckedModeBanner: false,
          getPages: screenRoutes(),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: ColorPallete.primaryColor,
                    ),
                  ),
                );
              } else if (snapshot.data != null) {
                return MainScreen();
              }
              return LoginScreen();
            },
          ),
        ),
      ),
    );
  }
}
