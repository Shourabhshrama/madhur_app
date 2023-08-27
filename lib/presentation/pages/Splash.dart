import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:madhur_app/data/session/SessionManager.dart';
import 'package:madhur_app/domain/usecases/AuthenticateUser.dart';
import 'package:madhur_app/presentation/bloc/AuthBloc/AuthenticationBloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/constant.dart';
import 'Homescreen.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () => navigationPage());
  }

  Future<void> navigationPage() async {
    final GetIt locator = GetIt.instance;
    bool? isLoggedIn = SessionManager().getBool(IS_LOGGED_IN);
    if (isLoggedIn != null && isLoggedIn) {
      moveNextScreen(Homescreen());
    } else {
      moveNextScreen(LoginScreen());
    }
  }

  moveNextScreen(Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Image.asset(
        "assets/images/s.jpg",
        // height: ScreenUtil().setHeight(200),
        // width: ScreenUtil().setWidth(203),
        fit: BoxFit.cover,
      ),
    );
  }
}
