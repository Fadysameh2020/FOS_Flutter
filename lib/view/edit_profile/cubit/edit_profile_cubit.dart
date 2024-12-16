import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/app_strings/app_strings.dart';
import '../../../core/constants.dart';
import '../../../models/edit_profile_model.dart';
import '../../../models/location_model.dart';
import '../../../repositories/auth_repository/auth_repo.dart';
import '../../../repositories/settings_repository/settings_repo.dart';
import '../../../reusable_widgets/FlutterMessage.dart';
import '../../app_layout/cubit/app_cubit.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final SettingsRepo settingsRepo;
  final AuthRepo authRepo;

  EditProfileCubit({required this.settingsRepo, required this.authRepo})
      : super(SettingsInitial());

  static EditProfileCubit get(context) => BlocProvider.of(context);
  var editProfileKey = GlobalKey<FormState>();

  var firstNameController =
      TextEditingController(text: userData?.firstName ?? '');
  var lastNameController =
      TextEditingController(text: userData?.lastName ?? '');
  var phoneController = TextEditingController(text: userData?.phone ?? '');
  var emailController = TextEditingController(text: userData?.email ?? '');
  String? selectedCountryId = userData?.governorate?.country?.id ?? '';
  String? selectedGovernorateId = userData?.governorate?.id ?? '';

  Country? selectedCountry;
  Governorate? selectedGovernorate;
  bool handledEditAccountPage = false;

  void handleEditProfileDetails({required context}) async {
    await getAllCountries();
    selectedCountry = userData?.governorate?.country;
    await getGovernoratesOfCountry(id: selectedCountry?.id);
    selectedGovernorate = userData?.governorate;
    handledEditAccountPage = true;
    refreshEditProfileCubit();
  }

  void refreshEditProfileCubit() {
    emit(RefreshEditProfileCubit());
  }

  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        refreshEditProfileCubit();
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Error picking profile image: $e');
      }
      refreshEditProfileCubit();
    }
  }

  void removeImage() {
    image = null;
    refreshEditProfileCubit();
  }

  List<Country>? countries;

  Future<void> getAllCountries() async {
    emit(GetSettingsAllCountriesLoadingState());
    var result = await authRepo.getAllCountries();
    result.fold((failure) {
      emit(GetSettingsAllCountriesFailureState(message: failure.message));
    }, (data) {
      countries = data;
      emit(GetSettingsAllCountriesSuccessState());
    });
  }

  List<Governorate>? governorates;

  Future<void> getGovernoratesOfCountry({required id}) async {
    selectedGovernorate = null;
    governorates = null;
    emit(GetSettingsGovernoratesOfCountryLoadingState());
    var result = await authRepo.getGovernoratesOfCountry(id: id);
    result.fold((failure) {
      emit(GetSettingsGovernoratesOfCountryFailureState(
          message: failure.message));
    }, (data) {
      governorates = data;
      emit(GetSettingsGovernoratesOfCountrySuccessState());
    });
  }

  Future<void> editProfile() async {
    emit(EditProfileDataLoadingState());
    BuildContext context =
        AppRouter.router.routerDelegate.navigatorKey.currentContext!;
    String fileName = "";
    if (image != null) {
      fileName = image!.path.split('/').last;
    }
    dynamic file;
    file = fileName.isNotEmpty
        ? await MultipartFile.fromFile(image!.path, filename: fileName)
        : null;
    EditProfileModel data = EditProfileModel(
      file: file,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      governorateId: selectedGovernorateId ?? '',
    );
    var result = await settingsRepo.editProfile(model: data);
    result.fold((failure) {
      emit(EditProfileDataFailureState(message: failure.message));
    }, (data) {
      emit(EditProfileDataSuccessState());

      AppCubit.get(context).getUserData();
    });
  }

// var deleteAccountPassController = TextEditingController();
//
// Future<void> deleteAccount() async {
//   BuildContext context =
//       AppRouter.router.routerDelegate.navigatorKey.currentContext!;
//   LoadingDialog.show(context);
//   emit(DeleteAccountLoadingState());
//   var result = await settingsRepo.deleteAccount(
//       password: deleteAccountPassController.text);
//   result.fold((l) {
//     LoadingDialog.hide(context);
//
//     FlutterMessage.show(message: l.message);
//     emit(DeleteAccountFailureState(message: l.message));
//   }, (r) {
//     LoadingDialog.hide(context);
//     emit(DeleteAccountSuccessState());
//
//     FlutterMessage.show(
//         message: AppStrings.accountDeletedSuccessfully.tr(context));
//
//     AppCubit.get(context).logOut(context: context);
//   });
// }
}
