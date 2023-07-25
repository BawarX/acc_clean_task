part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable{}

class CheckLoginEvent extends LoginEvent{

  final LoginModel loginDTO;
  CheckLoginEvent({required this.loginDTO});
  
  @override
  List<Object?> get props => [loginDTO];
 }