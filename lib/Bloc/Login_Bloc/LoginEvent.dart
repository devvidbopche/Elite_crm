import 'package:equatable/equatable.dart';

abstract class LoginEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class LoginPressedEvent extends LoginEvent{
  String username;
  String password;


  LoginPressedEvent(this.username,this.password);
}