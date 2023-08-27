import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madhur_app/core/constant/colors.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassBloc.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassEvent.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassState.dart';
import 'package:madhur_app/presentation/pages/LoginScreen.dart';
import 'package:madhur_app/presentation/widgets/text_widgets.dart';
import 'package:madhur_app/presentation/widgets/roundedbutton.dart';

import '../Navigator/Navigator.dart';

class ForgotPassword extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final String userId;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  ForgotPassword(this.userId);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Form(
                    key: _formKey,
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
                            pageTitleText("Forgot Password"),
                          ],
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        BlocBuilder<ChangePassBloc, ChangePassState>(
                          builder: (context, state) {
                            if (state is ChangePassErrorState) {
                              return errorText(state.error);
                            } else {
                              return Container();
                            }
                          },
                        ),
                        titleText('Token'),
                        Padding(
                          padding: EdgeInsets.only(
                            //top: ScreenUtil().setHeight(30),
                            left: ScreenUtil().setWidth(24),
                            right: ScreenUtil().setWidth(24),
                            bottom: ScreenUtil().setHeight(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                // BoxShadow(
                                //   blurRadius: 1.0,
                                // ),
                              ],
                              borderRadius: BorderRadius.circular(24.r),
                              //color: Color(0xffFFFFFF)
                            ),
                            child: TextFormField(
                              // maxLength: 10,
                              textInputAction: TextInputAction.next,
                              controller: tokenController,
                              //  keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Enter token ',
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
                                BlocProvider.of<ChangePassBloc>(context).add(
                                    ChangePassWordTextChangeEvent(
                                        passwordController.text.toString(),
                                        confirmController.text.toString(),
                                        tokenController.text.toString()));
                              },
                            ),
                          ),
                        ),
                        titleText('New Password'),
                        Padding(
                          padding: EdgeInsets.only(
                            //top: ScreenUtil().setHeight(30),
                            left: ScreenUtil().setWidth(24),
                            right: ScreenUtil().setWidth(24),
                            bottom: ScreenUtil().setHeight(15),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                // BoxShadow(
                                //   blurRadius: 1.0,
                                // ),
                              ],
                              borderRadius: BorderRadius.circular(24.r),
                              //color: Color(0xffFFFFFF)
                            ),
                            child: TextFormField(
                              // maxLength: 10,
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              //  keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Enter new password',
                                  // suffixIcon: IconButton(
                                  //   icon: const Icon(
                                  //     // Based on passwordVisible state choose the icon
                                  //     // _passwordVisible
                                  //     //     ? Icons.visibility
                                  //     //     :
                                  //     Icons.visibility_off,
                                  //     color: Color(0xff303B91),
                                  //   ),
                                  //   onPressed: () {
                                  //     // Update the state i.e. toogle the state of passwordVisible variable
                                  //   },
                                  // ),
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

                              //(v) => validateMobile(v!),
                              onChanged: (val) {
                                BlocProvider.of<ChangePassBloc>(context).add(
                                    ChangePassWordTextChangeEvent(
                                        passwordController.text.toString(),
                                        confirmController.text.toString(),
                                        tokenController.text.toString()));
                              },
                            ),
                          ),
                        ),
                        titleText('Confirm Password'),
                        Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(24),
                            right: ScreenUtil().setWidth(24),
                          ),
                          child: TextFormField(
                            //textInputAction: TextInputAction.done,

                            controller: confirmController,

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.r)),
                                hintText: 'Confirm your new Password',
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
                              BlocProvider.of<ChangePassBloc>(context).add(
                                  ChangePassWordTextChangeEvent(
                                      passwordController.text.toString(),
                                      confirmController.text.toString(),
                                      tokenController.text.toString()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        BlocConsumer<ChangePassBloc, ChangePassState>(
                            listener: (context, state) {
                          if (state is ChangePassSuccessState) {
                            moveScreen(context, LoginScreen());
                          }
                        }, builder: (context, state) {
                          if (state is ChangePassLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return submitButton(context);
                          }
                        })
                      ],
                    )),
              ),
            ));
  }

  Widget submitButton(BuildContext context) {
    return RoundedButton(
      btname: "Update Password",
      callback: () {
        BlocProvider.of<ChangePassBloc>(context).add(
            ChangePasswordSubmitButtonEvent(
                userId,
                passwordController.text.toString(),
                confirmController.text.toString(),
                tokenController.text.toString()));
      },
    );
  }
}
