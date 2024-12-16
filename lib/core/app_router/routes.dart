
import 'package:go_router/go_router.dart';

import '../../view/app_layout/app_layout.dart';
import '../../view/auth/forget_password/cubit/forget_password_cubit.dart';
import '../../view/auth/forget_password/forget_password_screen.dart';
import '../../view/auth/forget_password/reset_password_screen.dart';
import '../../view/auth/forget_password/verify_reset_password.dart';
import '../../view/auth/login/login_screen.dart';
import '../../view/auth/register/register_screen.dart';
import '../../view/auth/verify_email/verify_email_screen.dart';
import '../../view/change_password/change_password_screen.dart';
import '../../view/edit_profile/edit_profile_screen.dart';
import '../../view/notifications/notifications_screen.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/web_view_screen/web_view_screen.dart';

abstract class AppRouter {
  //Start
  static const splashScreen = '/';
  static const appLayoutScreen = '/appLayoutScreen';
  static const notificationsScreen = '/notificationsScreen';
  static const changePasswordScreen = '/changePasswordScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const verifyResetPasswordScreen = '/verifyResetPasswordScreen';
  static const resetPasswordScreen = '/resetPasswordScreen';
  static const loginScreen = '/loginScreen';
  static const verifyEmailScreen = '/verifyEmailScreen';
  static const registerScreen = '/registerScreen';
  static const webViewScreen = '/webViewScreen';

  static final router = GoRouter(
    routes: [
      // SplashScreen
      GoRoute(
        path: splashScreen,
        builder: (context, state) => SplashScreen(),
      ),

      // LoginScreen
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),

      // VerifyEmailScreen
      GoRoute(
        path: verifyEmailScreen,
        builder: (context, state) => VerifyEmailScreen(
          email: state.extra as String?,
        ),
      ),

      // RegisterScreen
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),

      // NotificationsScreen
      GoRoute(
        path: notificationsScreen,
        builder: (context, state) => const NotificationsScreen(),
      ),



      // AppLayoutScreen
      GoRoute(
        path: appLayoutScreen,
        builder: (context, state) => const AppLayoutScreen(),
      ),

      // ChangePasswordScreen
      GoRoute(
        path: changePasswordScreen,
        builder: (context, state) => const ChangePasswordScreen(),
      ),

      // EditProfileScreen
      GoRoute(
        path: editProfileScreen,
        builder: (context, state) => const EditProfileScreen(),
      ),

      // ForgetPasswordScreen
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),

      // VerifyResetPasswordScreen
      GoRoute(
        path: verifyResetPasswordScreen,
        builder: (context, state) => VerifyResetPasswordScreen(
          cubit: state.extra as ForgetPasswordCubit,
        ),
      ),

      // ResetPasswordScreen
      GoRoute(
        path: resetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(
          cubit: state.extra as ForgetPasswordCubit,
        ),
      ),

      // WebViewScreen
      GoRoute(
        path: webViewScreen,
        builder: (context, state) => WebViewScreen(
          url: state.extra as String,
        ),
      ),
    ],  );
}


