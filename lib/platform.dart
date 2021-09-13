import 'package:facebook_app/size_config.dart';
import 'package:flutter/material.dart';

class Platform {
  bool deviceType() {
    return SizeConfig.screenWidth <= 900 ? true : false;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 900;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 900;
}