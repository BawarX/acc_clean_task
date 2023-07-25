import 'package:acc_clean_task/features/Domain/Entities/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class LoginRepositoryAbs{
  Future<Either<Failure,bool>> login(LoginModel login);
}