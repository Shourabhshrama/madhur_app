import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:madhur_app/core/constant/constant.dart';
import 'package:madhur_app/data/model/UserResponse.dart';
import 'package:madhur_app/presentation/Navigator/Navigator.dart';

import 'package:madhur_app/presentation/bloc/AuthBloc/AuthenticationBloc.dart';
import 'package:madhur_app/presentation/bloc/AuthBloc/authentication_event.dart';
import 'package:madhur_app/presentation/bloc/AuthBloc/authentication_state.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassBloc.dart';
import 'package:madhur_app/presentation/pages/Homescreen.dart';
import 'package:madhur_app/presentation/pages/reset_password.dart';
import 'package:madhur_app/presentation/widgets/decorations/EditFeildDecoration.dart';
import 'package:madhur_app/presentation/widgets/roundedbutton.dart';
import 'package:madhur_app/presentation/widgets/text_widgets.dart';

import '../../core/constant/colors.dart';
import '../../data/session/SessionManager.dart';

import '../../domain/usecases/AuthenticateUser.dart';
import 'ForgotPassword.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _checkbox = false;
  bool _passwordVisible = false;

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: loginForm(context),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: const BoxDecoration(
                    color: bdWhite,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 80.w,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sign In",
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
              height: 43.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Image.asset(
                "assets/images/h.png",
                // height: ScreenUtil().setHeight(200),
                // width: ScreenUtil().setWidth(203),
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, bottom: 3),
              child: Text("Lorem ipsum dolor sit amet, consectetur"),
            ),
            SizedBox(
              height: 53.h,
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state is AuthenticationFailure) {
                return errorText(state.error);
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
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  decoration: EditFieldDecoration(
                    'Enter your email address',
                  ),
                  onChanged: (value) {
                    // Add this onChanged callback to handle text changes

                    BlocProvider.of<AuthenticationBloc>(context).add(
                        TextChangeEvent(
                            emailValue: emailController.text.toString(),
                            passwordValue: passwordController.text.toString()));
                  },
                  //(v) => validateMobile(v!),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 8),
              child: Text(
                'password',
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
                obscureText: !_passwordVisible,
                controller: passwordController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  // Add this onChanged callback to handle text changes
                  print(value);
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      TextChangeEvent(
                          emailValue: emailController.text.toString(),
                          passwordValue: passwordController.text.toString()));
                },
              ),
            ),
            SizedBox(
              height: 21.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    var locator = GetIt.instance;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: tBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
              if (state is AuthenticationLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AuthenticationSuccess) {
                saveUserSessionAndMoveToNextScreen(context, state.user);
                return Text("");
              } else {
                return SubmitButton(context);
              }
            }),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom))
          ],
        ),
      ),
    );
  }

  Widget SubmitButton(BuildContext context) {
    return Center(
      child: RoundedButton(
        btname: "Sign In",
        callback: () async {
          if (_formKey.currentState!.validate() == true) {
            String email = emailController.text.toString();
            String password = passwordController.text.toString();

            BlocProvider.of<AuthenticationBloc>(context)
                .add(LoginButtonPressed(email: email, password: password));
          }
        },
      ),
    );
  }

  Future<void> saveUserSessionAndMoveToNextScreen(
      BuildContext context, UserResponse user) async {
    await SessionManager().setBool(IS_LOGGED_IN, true);
    await SessionManager().setString('id', user.userdata.id);
    await SessionManager().setString('email', user.userdata.email);
    await SessionManager().setString('name', user.userdata.name);
    await SessionManager().setString('country', user.userdata.country);
    await SessionManager().setString('state', user.userdata.state);
    await SessionManager().setString('city', user.userdata.city);
    await SessionManager().setString('device_id', user.userdata.device_id);
    await SessionManager().setString('phone', user.userdata.phone);
    await SessionManager()
        .setString('monthlytarget', user.userdata.monthlytarget);
    await SessionManager()
        .setString('territoryarea', user.userdata.territoryarea);
    moveScreen(context,   Homescreen());
  }
}
