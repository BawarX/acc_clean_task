
import 'package:acc_clean_task/core/error/failure.dart';
import 'package:acc_clean_task/features/Data/Model/user.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  final String uri;

  LoginApi({required this.uri});

  Future<Either<Failure,UserModel>> login(String email, String password) async {
    //TODO: implement api link here!
    const url = '';
    final response = await http.get(
      Uri.parse(url),
    );
    try {
      //TODO: implement Error Handling
      if (response.statusCode == 200) {
        return right( UserModel.fromJson(response.body as Map<String, dynamic>));
      }else {
       throw Exception('dd');
      }
    } catch(e){
      return Left(ServerFailure());
    }
    
  }
}
