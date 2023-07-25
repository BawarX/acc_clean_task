import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{
   final String login;
  final String password;

  const LoginModel({required this.login,required this.password});
  
  @override
  List<Object?> get props => [login,password];
}