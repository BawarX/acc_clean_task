
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  List<Object?> get props => [];

}

class ServerFailure extends Failure{
@override
  List<Object?> get props => [];
}

class DataBaseFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class LoginFailure extends Failure{
  @override
  List<Object?> get props => [];
}