import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:research_hub/features/auth/presentation/screens/forgot%20password%20screen/forgot_password_screen.dart';
import 'package:research_hub/features/auth/presentation/screens/login%20screen/login_screen.dart';
import 'package:research_hub/features/explore/presentation/screens/category_screen.dart';
import 'package:research_hub/features/home/presentation/screens/domain_screen.dart';
import 'package:research_hub/features/profile/presentation/screens/change%20password/change_password_screen.dart';
import 'package:research_hub/features/profile/presentation/screens/edit%20profile/edit_profile_screen.dart';
import 'package:research_hub/features/projects/presentation/screens/full_screen_image_viewer.dart';
import 'package:research_hub/features/projects/presentation/screens/project_screen.dart';
import 'package:research_hub/main%20screen/main_screen.dart';

screenRoutes() => [
  GetPage(name: '/login', page: () => LoginScreen()),
  GetPage(name: '/forgotPassword', page: () => ForgotPasswordScreen()),
  GetPage(name: '/main', page: () => MainScreen()),
  GetPage(name: '/editProfile', page: () => EditProfileScreen()),
  GetPage(name: '/changePassword', page: () => ChangePasswordScreen()),
  GetPage(name: '/imageViewer', page: () => FullScreenImageViewer()),
  GetPage(name: '/domain', page: () => DomainScreen()),
  GetPage(name: '/project', page: () => ProjectScreen()),
  GetPage(name: '/category', page: () => CategoryScreen()),
];
