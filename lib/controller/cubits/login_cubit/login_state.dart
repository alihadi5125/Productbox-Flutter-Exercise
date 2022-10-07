part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class EmailNotExistState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSocketException extends LoginState {
  @override
  List<Object> get props => [];
}
