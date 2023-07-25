part of 'login_bloc.dart';


abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class CheckingLoginState extends LoginState{
  @override
  List<Object?> get props => [];
}

class LoggedState extends LoginState{
  @override
  List<Object?> get props => [];
}

class ErrorLoggedState extends LoginState{
  @override
  List<Object?> get props => [];
}