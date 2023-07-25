import 'dart:async';

import 'package:acc_clean_task/features/Domain/Entities/login_model.dart';
import 'package:acc_clean_task/features/Domain/UseCase/login_usecase.dart';
import 'package:acc_clean_task/features/Presentaiton/dto/login_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<CheckLoginEvent>(_checkLoginEvent);
  }

  FutureOr<void> _checkLoginEvent(
      CheckLoginEvent event, Emitter<LoginState> emit) async {
    final result = await loginUseCase.call(
      Params(
        login: event.loginDTO,
      ),
    );
    return result.fold(
      (l) => emit(ErrorLoggedState()),
      (r) => emit(LoggedState()),
    );
  }
}
