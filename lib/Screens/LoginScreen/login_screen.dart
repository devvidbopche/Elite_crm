// ignore_for_file: use_build_context_synchronously
import 'package:elite_crm/Screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../Bloc/Login_Bloc/LoginBloc.dart';
import '../../Bloc/Login_Bloc/LoginEvent.dart';
import '../../Bloc/Login_Bloc/LoginState.dart';
import '../../Utils/color_constants.dart';
import '../../Utils/decoration_constants.dart';
import '../bottomNavigationPages.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool isLoading = false;




  void showLoaderDialog(BuildContext context) {
    setState(() {
      isLoading = true;
    });
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void hideLoaderDialog(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(),
    child: Scaffold(
      appBar: AppBar(backgroundColor: ColorConstants.deppp),
      body: BlocConsumer<LoginBloc,LoginState>(
      listener: (context,state){
        if(state is LoginSuccessState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const Homepage()), (route) => false);
        }else if(state is LoginErrorState){

            Fluttertoast.showToast(msg: 'Login Failed');
            hideLoaderDialog(context);

        }
      },builder: (context,state){
       return Container(
         // height: 100.h,
         // width: 100.w,
         // decoration: DecorationConstants.decorationGradient,
         child: Padding(
           padding: const EdgeInsets.only(right: 20,left: 20),
           child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Column(
               children: [
                  SizedBox(height: 150,),
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Image.asset('assets/images/logo.png'),
                 ),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: emailController,
                     decoration: InputDecoration(
                         hintText: 'Username or UserID',
                         fillColor: Colors.white,
                         filled: true,
                         focusedBorder:  OutlineInputBorder(
                           borderSide: BorderSide(
                             color:ColorConstants.deppp,style: BorderStyle.solid
                           )
                         ),
                         suffixIcon:  Icon(Icons.person,color: ColorConstants.deppp,),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(11))),
                   ),
                 ),
                 const SizedBox(height: 20),

                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: passwordController,
                     obscureText: !_passwordVisible,
                     decoration: InputDecoration(
                         hintText: 'Password',
                         fillColor: Colors.white,
                         filled: true,
                         focusedBorder:  OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: ColorConstants.deppp,style: BorderStyle.solid
                             )
                         ),
                         suffixIcon: IconButton(
                           icon: Icon(
                             _passwordVisible
                                 ? Icons.visibility
                                 : Icons.visibility_off,
                             color:ColorConstants.deppp,
                           ),
                           onPressed: () {
                             setState(() {
                               _passwordVisible = !_passwordVisible;
                             });
                           },
                         ),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(11))),
                   ),
                 ),
                 const SizedBox(height: 10,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: const [
                     Text('ForgetPassword?',style: TextStyle(fontWeight: FontWeight.bold),)
                   ],
                 ), const SizedBox(height: 10,),
                 SizedBox(width: 350,height: 50,
                     child: ElevatedButton(onPressed: () async {
                       if (emailController.text.isEmpty) {
                         // Dialogs.showValidationMessage(context,
                         //     MessageConstants.emailEmptyValidation);
                         showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return  AlertDialog(
                                 // title: Text("Alert Dialog"),
                                 content: const Text("      Enter valid Email"),
                                 actions: [
                                   Center(
                                     child: ElevatedButton(onPressed: (){
                                       Navigator.pop(context);
                                     },style: ElevatedButton.styleFrom(
                                         backgroundColor: ColorConstants.primaryColor
                                     ), child: const Text('Ok')),
                                   ),
                                 ],
                               );
                             }
                         );
                       } else if (passwordController.text.isEmpty) {
                         // Dialogs.showValidationMessage(context,
                         //     MessageConstants.passwordEmptyValidation);
                         showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return  AlertDialog(
                                 // title: Text("Alert Dialog"),
                                 content: const Text("Enter valid Password"),
                                 actions: [
                                   Center(
                                     child: ElevatedButton(onPressed: (){
                                       Navigator.pop(context);
                                     },style: ElevatedButton.styleFrom(
                                         backgroundColor: ColorConstants.appcolor
                                     ), child: const Text('Ok')),
                                   ),
                                 ],
                               );
                             }
                         );
                       } else  {
                         BlocProvider.of<LoginBloc>(context).add(
                             LoginPressedEvent(emailController.text, passwordController.text));
                         showLoaderDialog(context);

                       }
                     },style: ElevatedButton.styleFrom(
                         backgroundColor: ColorConstants.deppp
                     ), child: const Text('SignIn')))
               ],
             ),
           ),
         ),
       );
      },
      ))
    );
  }
}
