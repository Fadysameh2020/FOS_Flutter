import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/location_model.dart';
import '../../../../models/register_model.dart';
import '../../../../repositories/auth_repository/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo repo;

  RegisterCubit({required this.repo}) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

//register screen
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool registerLoadingController = false;
  var registerFormKey = GlobalKey<FormState>();

  Future<void> register() async {
    registerLoadingController = true;
    RegisterModel model = RegisterModel(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      governorateId: selectedGovernorate?.id ?? '',
    );
    emit(RegisterLoadingState());
    var result = await repo.register(model: model);
    result.fold((failure) {
      registerLoadingController = false;
      emit(RegisterFailureState(message: failure.message));
    }, (data) {
      registerLoadingController = false;
      emit(RegisterSuccessState());
    });
  }

  Country? selectedCountry;
  List<Country>? countries;

  Future<void> getAllCountries() async {
    emit(GetAllCountriesLoadingState());
    var result = await repo.getAllCountries();
    result.fold((failure) {
      emit(GetAllCountriesFailureState(message: failure.message));
    }, (data) {
      countries = data;
      emit(GetAllCountriesSuccessState());
    });
  }

  Governorate? selectedGovernorate;
  List<Governorate>? governorates;

  Future<void> getGovernoratesOfCountry({required id}) async {
    selectedGovernorate = null;
    governorates = null;
    emit(GetGovernoratesOfCountryLoadingState());
    var result = await repo.getGovernoratesOfCountry(id: id);
    result.fold((failure) {
      emit(GetGovernoratesOfCountryFailureState(message: failure.message));
    }, (data) {
      governorates = data;
      emit(GetGovernoratesOfCountrySuccessState());
    });
  }
}
