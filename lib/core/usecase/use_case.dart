import 'package:acc_clean_task/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type,Equatable>{
  Future<Either<Failure,bool>> call(Equatable params);
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}