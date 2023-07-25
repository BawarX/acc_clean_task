import 'package:acc_clean_task/core/error/failure.dart';
import 'package:acc_clean_task/features/Data/DataSource/login_user.dart';
import 'package:acc_clean_task/features/Domain/Entities/login_model.dart';
import 'package:acc_clean_task/features/Domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl extends LoginRepositoryAbs {
  late final LoginUser loginUser;

  @override
  Future<Either<Failure, bool>> login(LoginModel login) async {
    try {
      final user = await loginUser.login(login);
      return Right(user != null);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
