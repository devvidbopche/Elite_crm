
import 'Screens/Homepage.dart';
import 'Screens/LoginScreen/login_screen.dart';
import 'Screens/splesh_screen.dart';



const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";

final routes = {
  SplashRoute: (context) => SplashView(),
  HomeRoute: (context) => DealerList(),
  LoginRoute: (context) => LoginPage()
};
