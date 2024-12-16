import 'package:dartz/dartz.dart';

import '../../core/networks/failures.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, Unit>> forgetPassword({required String email});
  Future<Either<Failure, Unit>> verifyResetPassword(
      {required String email, required String code});
  Future<Either<Failure, Unit>> resetPassword({
    required String email,
    required String newPassword,
    required String confirmNewPassword,
  });
}
