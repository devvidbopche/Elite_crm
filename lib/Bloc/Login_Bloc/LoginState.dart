import 'package:equatable/equatable.dart';


abstract class LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{

}

class LoginSuccessState extends LoginState{}

  class LoginErrorState extends LoginState{
   String error;

  LoginErrorState(this.error);
}

