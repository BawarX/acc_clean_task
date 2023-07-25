import 'package:acc_clean_task/features/Data/Model/user.dart';
import 'package:acc_clean_task/features/Domain/Entities/login_model.dart';

class LoginUser{
  Future<UserModel> login(LoginModel login)async{
    if(login.login == 'user' && login.password == 'password'){
      return const UserModel(id: '1', user: 'bawar');
    } 
    throw Exception('Invalid credentials!');
  }
}