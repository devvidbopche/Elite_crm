import 'package:flutter/cupertino.dart';
import 'color_constants.dart';

class DecorationConstants
{


  static var decorationGradient= BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
  ColorConstants.lightBlueColor,
  ColorConstants.DarkBlueColor
  ],
  ));


}