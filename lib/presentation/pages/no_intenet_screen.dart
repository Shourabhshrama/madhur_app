import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madhur_app/presentation/bloc/connectivityBloc/connectivity_bloc.dart';
import 'package:madhur_app/presentation/widgets/roundedbutton.dart';

import '../../core/constant/colors.dart';
import '../bloc/connectivityBloc/connectivity_event.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 65.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 24,
                        ),

                        SizedBox(
                          width: 60.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "No Internet Connection",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: tBlack,
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 64),
                    Icon(Icons.network_check),
                    SizedBox(height: 32),
                    const Center(
                      child: Text(
                        'Whoops!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'No internet connection found. Check your connection or try again.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    RoundedButton(
                      btname: "Retry",
                      callback: () {
                        BlocProvider.of<ConnectivityBloc>(context)
                            .add(ConnectivityAvailableEvent());
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
