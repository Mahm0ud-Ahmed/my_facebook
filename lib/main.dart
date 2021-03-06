import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/screens/home/home_screen_web.dart';
import 'package:facebook_app/ui/styled_componants/style.dart';
import 'package:facebook_app/view_model/cubit/facebook_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'observer.dart';
import 'ui/screens/home/home_screen_mobile.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(FacebookApp());
}

class FacebookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Facebook UI',
      theme: appThem,
      home: BlocProvider<FacebookCubit>(
        create: (context) => FacebookCubit(),
        child: Builder(
          builder: (BuildContext context) {
            SizeConfig().init(context);
            return Platform().deviceType()
                ? const HomeScreenMobile()
                : const HomeScreenWeb();
          },
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
