import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/icon_broken.dart';
import '../../../../repositories/auth_repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo repo;

  LoginCubit({required this.repo}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool loginLoadingController = false;
  var loginFormKey = GlobalKey<FormState>();
  IconData suffix = IconBroken.Hide;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? IconBroken.Hide : IconBroken.Show;
    emit(LoginChangePasswordVisibilityState());
  }

  Future<void> login() async {
    loginLoadingController = true;
    emit(LoginLoadingState());
    var result = await repo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      loginLoadingController = false;
      emit(LoginFailureState(message: failure.message));
    }, (data) async {
      userData = data;
      emit(LoginSuccessState());

      loginLoadingController = false;

      // socketService.connect();
    });
  }
}
