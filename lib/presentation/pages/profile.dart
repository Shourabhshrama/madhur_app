import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:madhur_app/data/session/SessionManager.dart';

import '../../core/constant/colors.dart';
import '../widgets/bttn.dart';
import '../widgets/tf.dart';

class UserData {
  final String name;
  final String email;
  final String phone;

  UserData.name(this.name, this.email, this.phone);
}

class Profile extends StatelessWidget {
  Future<UserData> _loadProfileData() async {
    String? name = await SessionManager().getString("name");
    String? email = await SessionManager().getString("email");
    String? phone = await SessionManager().getString("phone");

    UserData profile = UserData.name(name ?? "", email ?? "", phone ?? "");

    return profile;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          //  centerTitle: false,
          elevation: 1,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  //  size: 24,
                ),
              )),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Bttn(
              btntext: "Help",
              callback: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const EditProfile()),
                // );
              },
            ),

          ],
        ),
        body: FutureBuilder(
            future: _loadProfileData(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  const SizedBox(
                    height: 21,
                  ),
                  Center(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                    ),

                    //  CircleAvatar(
                    //
                    //   // child: SvgPicture.asset("assets/images/p.svg"),
                    //
                    //     backgroundImage: new NetworkImage(
                    //        'https://miro.medium.com/max/1400/1*uC0kYhn8zRx8Cfd0v0cYQg.jpeg'),
                    // //   backgroundImage: SvgPicture.asset('assets/images/cat3.png'),
                    // //   backgroundColor: Colors.red,
                    //    radius: 50,
                    //  ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    snapshot.data?.name ?? "",
                    style: TextStyle(
                        color: tBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Tf(
                    hintText: snapshot.data?.name ?? "Enter Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Tf(
                    hintText: snapshot.data?.email ?? "Enter Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Tf(
                    hintText: snapshot.data?.phone ?? "Enter Mobile",
                  ),
                ],
              );
            }),
      ),
    );
  }
}
