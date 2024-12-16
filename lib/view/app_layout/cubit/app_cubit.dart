import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/app_strings/app_strings.dart';
import '../../../core/constants.dart';
import '../../../core/networks/local/cache_helper.dart';
import '../../../repositories/auth_repository/auth_repo.dart';
import '../../../repositories/settings_repository/settings_repo.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../../reusable_widgets/loading_dialog.dart';
import '../../home_screen/home_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AuthRepo repo;
  SettingsRepo settingsRepo;

  AppCubit({required this.repo, required this.settingsRepo})
      : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int navBarIndex = 0;

  void changeBottomNavBar({required int index, required BuildContext context}) {
    ;
    // For any other index, change the navigation bar index.
    navBarIndex = index;
    emit(ChangeBottomNavBar());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
  ];

  String? locale;

  Future<void> getSavedLocale() async {
    locale = await CacheHelper.getData(key: 'locale');
    isEnglishLocale = locale == 'en';
    emit(ChangeLocaleState());
  }

  Future<void> saveDeviceLocale({required BuildContext context}) async {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    if (kDebugMode) {
      print('device locale is $currentLanguage');
    }
    await CacheHelper.saveData(key: 'locale', value: currentLanguage);
    await getSavedLocale();
  }

  Future<void> changeLocale({required String languageCode}) async {
    await CacheHelper.saveData(key: 'locale', value: languageCode);
    getSavedLocale();
  }

  Future<void> getUserData() async {
    if (isLoggedIn) {
      Future.delayed(Duration(seconds: 2), () async {
        emit(GetUserDataLoadingState());
        var result = await repo.getUserData();
        result.fold((failure) {
          emit(GetUserDataFailureState(message: failure.message));
        }, (data) {
          userData = data;
          emit(GetUserDataSuccessState());
        });
      });
    }
  }

  Future<void> logOut({required context}) async {
    await removeToken();
    userData = null;
    // socketService.disconnect();
    AppCubit.get(context).navBarIndex = 0;
    emit(LogoutState());
    GoRouter.of(context).go(AppRouter.splashScreen);
  }

  Future<void> launchLink(String link) async {
    try {
      Uri url = Uri.parse(link);
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.platformDefault,
        );
      } else {
        throw 'Could not launch URL: $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  Future<void> launchCall({required number}) async {
    Uri telephoneUrl = Uri.parse("tel:$number");
    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      throw "Error occured trying to call that number.";
    }
  }

  Future<void> launchDocInExternalApp(String docUrl) async {
    if (await canLaunchUrl(Uri.parse(docUrl))) {
      await launchUrl(
        Uri.parse(docUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $docUrl';
    }
  }

  Future<void> launchEmail({required email}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  var deleteAccountPassController = TextEditingController();

  Future<void> deleteAccount() async {
    BuildContext context =
        AppRouter.router.routerDelegate.navigatorKey.currentContext!;
    LoadingDialog.show(context);
    emit(DeleteAccountLoadingState());
    var result = await settingsRepo.deleteAccount(
        password: deleteAccountPassController.text);
    result.fold((l) {
      LoadingDialog.hide(context);
      FlutterMessage.show(message: l.message);
      emit(DeleteAccountFailureState(message: l.message));
    }, (r) {
      LoadingDialog.hide(context);
      emit(DeleteAccountSuccessState());
      FlutterMessage.show(
          message: AppStrings.accountDeletedSuccessfully.tr(context));
      AppCubit.get(context).logOut(context: context);
    });
  }
}
