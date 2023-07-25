import 'package:acc_clean_task/core/error/failure.dart';
import 'package:acc_clean_task/core/usecase/use_case.dart';
import 'package:acc_clean_task/features/Domain/Entities/login_model.dart';
import 'package:acc_clean_task/features/Domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Login implements UseCase<bool,Params>{
  late final LoginRepositoryAbs loginRepository;
  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await loginRepository.login(params.login);
  }
}

class Params extends Equatable{
  final LoginModel login;
  const Params({required this.login});
  
  @override
  List<Object?> get props => [];
}