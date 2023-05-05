import 'package:bloc/bloc.dart';
import '../../Service/Login_Service/Login_servie.dart';
import '../../Utils/message_contants.dart';
import 'LoginEvent.dart';
import 'LoginState.dart';



class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():  super(LoginInitialState()){

    on<LoginPressedEvent>((event, emit) async{
      emit(LoginLoadingState());

      dynamic result = await LoginService().loginUser(event.username, event.password);

        if(result == ConstantsMessage.serveError){
          emit(LoginErrorState(ConstantsMessage.serveError));
      }else if (result == ConstantsMessage.incorrectPassword) {
        emit(LoginErrorState(ConstantsMessage.incorrectPassword));
      }else{
          //
          // Utils().setUserLoggedIn(true);
          // Utils().setUserId(event.username);
          // Utils().setUserPassword(event.password);
        emit(LoginSuccessState());
      }
    });
  }
}
