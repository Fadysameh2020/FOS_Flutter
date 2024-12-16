import 'package:dartz/dartz.dart';

import '../../core/networks/failures.dart';
import '../../models/edit_profile_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String>> changePassword(
      {required String currentPassword, required String newPassword});

  Future<Either<Failure, Unit>> editProfile({required EditProfileModel model});

  Future<Either<Failure, Unit>> deleteAccount({required password});
}
