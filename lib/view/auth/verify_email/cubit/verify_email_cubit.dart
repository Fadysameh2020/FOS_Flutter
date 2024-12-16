import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constants.dart';
import '../../../../repositories/auth_repository/auth_repo.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo repo;

  VerifyEmailCubit({required this.repo}) : super(VerifyEmailInitial());

  static VerifyEmailCubit get(context) => BlocProvider.of(context);


  //verify email screen
  var verifyEmailFormKey = GlobalKey<FormState>();
  var verificationCodeController = TextEditingController();
  bool verifyEmailLoadingController = false;

  Future<void> verifyEmail({required email}) async {
    verifyEmailLoadingController = true;
    emit(VerifyAccountLoadingState());
    var result = await repo.verifyEmail(
      email: email,
      code: verificationCodeController.text,
    );
    result.fold((failure) {
      verifyEmailLoadingController = false;
      emit(VerifyAccountFailureState(message: failure.message));
    }, (data) {
      verifyEmailLoadingController = false;
      userData = data;
      // socketService.connect();
      emit(VerifyAccountSuccessState());
    });
  }

}
