import 'package:facebook_app/logic/cubit/facebook_cubit.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/screens/home/home_screen_web.dart';
import 'package:facebook_app/ui/styled_componants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/observer.dart';
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
      title: 'Facebook UI',
      theme: appThem,
      home: BlocProvider<FacebookCubit>(
        create: (context) => FacebookCubit(),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // print(constraints.minWidth);
            SizeConfig().init(context);
            // print(Platform().deviceType());
            return Platform().deviceType()
                ? HomeScreenMobile()
                : HomeScreenWeb();
          },
        ),
      ),
    );
  }
}
