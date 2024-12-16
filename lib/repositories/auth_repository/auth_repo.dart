import 'package:dartz/dartz.dart';

import '../../core/networks/failures.dart';
import '../../models/location_model.dart';
import '../../models/register_model.dart';
import '../../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> getUserData();

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> register({required RegisterModel model});

  Future<Either<Failure, List<Country>>> getAllCountries();

  Future<Either<Failure, List<Governorate>>> getGovernoratesOfCountry(
      {required id});

  Future<Either<Failure, UserModel>> verifyEmail({
    required String email,
    required String code,
  });
}
