import 'package:get/route_manager.dart';
import 'package:research_hub/ui/screens/change%20password/change_password_screen.dart';
import 'package:research_hub/ui/screens/domain/domain_screen.dart';
import 'package:research_hub/ui/screens/edit%20profile/edit_profile_screen.dart';
import 'package:research_hub/ui/screens/forgot%20password/forgot_password_screen.dart';
import 'package:research_hub/ui/screens/get%20started/get_started_screen.dart';
import 'package:research_hub/ui/screens/login/login_screen.dart';
import 'package:research_hub/ui/screens/main/main_screen.dart';

screenRoutes() => [
  GetPage(name: '/getStarted', page: () => GetStartedScreen()),
  GetPage(
    name: '/login',
    page: () => LoginScreen(),
    // transition: Transition.rightToLeft,
  ),
  GetPage(
    name: '/forgotPassword',
    page: () => ForgotPasswordScreen(),
    // transition: Transition.rightToLeft,
  ),
  GetPage(name: '/main', page: () => MainScreen()),
  GetPage(name: '/editProfile', page: () => EditProfileScreen(),),
  GetPage(name: '/changePassword', page: ()=> ChangePasswordScreen()),
  GetPage(name: '/domain', page: () => DomainScreen(),)
];
