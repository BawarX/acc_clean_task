import 'package:acc_clean_task/features/Presentaiton/bloc/login_bloc.dart';
import 'package:acc_clean_task/features/Presentaiton/dto/login_dto.dart';
import 'package:acc_clean_task/features/Presentaiton/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   late LoginBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String inputLogin;
  late String inputPassword;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Login Page',),
      ),
      body: BlocProvider
      (
        create: (_) => _bloc,
        child: BlocListener(
          bloc: _bloc,
          listener: (context,state){
            if(state is ErrorLoggedState){
              const snackBar = SnackBar(content: Text('Invalid credentials...'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if(state is LoggedState){
              const snackBar = SnackBar(content: Text('user logged...'),);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: BlocBuilder<LoginBloc,LoginState>(
            builder:(context, state) {
              if(state is LoginInitial){
               return Form(
                key: _formKey,
                child:  Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Placeholder(
                      fallbackHeight: 150,
                      fallbackWidth: 100,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter the userName',
                        labelText: 'user name'
                      ),
                      onChanged: (value){
                        inputLogin = value;
                      },
                      validator: (String? value){
                        return value!.isEmpty ? 'username is mandatory': null;
                      },
                    ),
                     const SizedBox(height: 30,),
                     TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password",
                        labelText: 'password *'
                      ),
                      onChanged: (valueChanged){
                        inputPassword = valueChanged;
                      },
                      validator: (String? value){
                        return value!.isEmpty ? 'passwrod is mandatory' : null; 
                      },
                     ),
                     const SizedBox(height: 30,),
                     ElevatedButton(
                      child: const Text(
                      'login'
                      ),
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          final loginDTO = LoginDTO(username: inputLogin, password: inputPassword,);
                        }
                      },
                     )
                  ],
                ),
                ),);
              }else if(state is CheckingLoginState){
                return const LoadingWidget();
              } else {
                   return const SizedBox(
                    height: 100,
                    width: 100,
                    child: Text("failed to rebuild"),
                   );
              }
            },),
          ),
       ),
    );
  }
}