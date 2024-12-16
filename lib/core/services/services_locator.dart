import 'package:get_it/get_it.dart';
import '../../repositories/auth_repository/auth_repo.dart';
import '../../repositories/auth_repository/auth_repo_impl.dart';
import '../../repositories/forget_password_repository/forget_password_repo.dart';
import '../../repositories/forget_password_repository/forget_password_repo_impl.dart';
import '../../repositories/home_repository/home_repo.dart';
import '../../repositories/home_repository/home_repo_impl.dart';

import '../../repositories/notifications_repository/notifications_repo.dart';

import '../../repositories/notifications_repository/notifications_repo_impl.dart';

import '../../repositories/settings_repository/settings_repo.dart';
import '../../repositories/settings_repository/settings_repo_impl.dart';

import '../../view/app_layout/cubit/app_cubit.dart';
import '../../view/auth/forget_password/cubit/forget_password_cubit.dart';
import '../../view/auth/login/cubit/login_cubit.dart';
import '../../view/auth/register/cubit/register_cubit.dart';
import '../../view/auth/verify_email/cubit/verify_email_cubit.dart';
import '../../view/change_password/cubit/change_password_cubit.dart';
import '../../view/edit_profile/cubit/edit_profile_cubit.dart';

import '../../view/home_screen/cubit/home_cubit.dart';
import '../../view/notifications/cubit/notifications_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // cubits
    sl.registerFactory(
        () => AppCubit(repo: sl<AuthRepo>(), settingsRepo: sl<SettingsRepo>()));

    sl.registerFactory(() => LoginCubit(repo: sl<AuthRepo>()));
    sl.registerFactory(() => RegisterCubit(repo: sl<AuthRepo>()));
    sl.registerFactory(() => HomeCubit(repo: sl<HomeRepo>()));
    sl.registerFactory(
        () => ForgetPasswordCubit(repo: sl<ForgetPasswordRepo>()));
    sl.registerFactory(() => NotificationsCubit(repo: sl<NotificationsRepo>()));
    sl.registerFactory(() => ChangePasswordCubit(
        profileRepo: sl<SettingsRepo>(), authRepo: sl<AuthRepo>()));
    sl.registerFactory(() => EditProfileCubit(
          settingsRepo: sl<SettingsRepo>(),
          authRepo: sl<AuthRepo>(),
        ));
    sl.registerFactory(() => VerifyEmailCubit(repo: sl<AuthRepo>()));

    //Repository
    sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
    sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
    sl.registerLazySingleton<NotificationsRepo>(() => NotificationsRepoImpl());
    sl.registerLazySingleton<ForgetPasswordRepo>(
        () => ForgetPasswordRepoImpl());
    sl.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl());
  }
}
