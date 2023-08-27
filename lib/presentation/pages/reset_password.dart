import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:madhur_app/core/constant/colors.dart';
import 'package:madhur_app/domain/usecases/AuthenticateUser.dart';
import 'package:madhur_app/presentation/Navigator/Navigator.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassBloc.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassBloc.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassEvent.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassState.dart';

import 'package:madhur_app/presentation/widgets/roundedbutton.dart';

import 'forgotpassword.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var forgotController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: const BoxDecoration(
                                color: Color(0xffFDFDFD),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Enter Email",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: tBlack,
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, bottom: 8),
                          child: Text(
                            'Enter your email and we will send you a link to reset your password',
                            style: TextStyle(
                              color: tGray,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                        SizedBox(height: 22.0),
                        BlocBuilder<ResetPassWordBloc, ResetPassState>(
                            builder: (context, state) {
                          if (state is ResetPassFailureState) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, bottom: 8),
                              child: Text(
                                state.error,
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, bottom: 8),
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              color: tBlack,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(14),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(24),
                            right: ScreenUtil().setWidth(24),
                          ),
                          child: TextFormField(
                            //textInputAction: TextInputAction.done,

                            controller: emailController,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                                hintText: 'Enter you email address',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 27.w, vertical: 18.h),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0.r),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                fillColor: const Color(0xffFFFFFF),
                                filled: true),

                            onChanged: (val) {
                              BlocProvider.of<ResetPassWordBloc>(context).add(
                                  ResetPassTextChangeEvent(
                                      emailValue:
                                          emailController.text.toString()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        BlocConsumer<ResetPassWordBloc, ResetPassState>(
                          listener: (context, state) {
                            if (state is ResetPassSuccessState) {
                              saveNextScreen(
                                  context, state.response.data.userid);
                            }
                          },
                          builder: (context, state) {
                            if (state is ResetPassInitialState) {
                              return submitButton(context);
                            } else if (state is ResetPassLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return submitButton(context);
                            }
                          },
                        )
                      ],
                    ),
                  )),
            ));
  }

  Future<void> saveNextScreen(BuildContext context, String userid) async {
    moveScreen(context, ForgotPassword(userid));
  }

  Widget submitButton(BuildContext context) {
    return RoundedButton(
      btname: "Reset Password",
      callback: () {
        BlocProvider.of<ResetPassWordBloc>(context)
            .add(ResetButtonPressed(email: emailController.text.toString()));
      },
    );
  }
}
