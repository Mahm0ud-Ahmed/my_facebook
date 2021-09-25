import 'package:facebook_app/size_config.dart';
import 'package:flutter/material.dart';

class Platform {
  bool deviceType() {
    return SizeConfig.screenWidth <= 900 ? true : false;
  }

  static bool isMobile() => SizeConfig.screenWidth <= 900;

  static bool isDesktop() => SizeConfig.screenWidth > 900;
}
