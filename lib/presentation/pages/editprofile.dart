
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:madhur_app/core/constant/colors.dart';
import 'package:madhur_app/presentation/widgets/roundedbutton.dart';
import 'package:madhur_app/presentation/widgets/tf.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // pick image file picker
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: false,
                elevation: 1,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 21,
                  ),
                  Stack(children: [
                    Center(
                      child: (imageFile != null)
                          ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40.0,
                        child: CircleAvatar(
                          radius: 38.0,
                          child: ClipOval(
                            child: Image.file(
                                        imageFile!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          // ClipOval(
                          //   child: Image.asset('assets/images/edit.png'),
                          // ),
                          backgroundColor: Colors.white,
                        ),
                      )
                      // CircleAvatar(
                      //         radius: 40,
                      //         child: Image.file(
                      //           imageFile!,
                      //           height: 100,
                      //           width: 100,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       )
                          : Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://miro.medium.com/max/1400/1*uC0kYhn8zRx8Cfd0v0cYQg.jpeg'),
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
                    Positioned(
                        // bottom: 10,
                        left: 205,
                        child:
                            // new CircleAvatar(
                            //   radius: 40,
                            //   //   borderRadius: BorderRadius.circular(8.0),
                            //   backgroundImage: new NetworkImage(
                            //       'https://miro.medium.com/max/1400/1*uC0kYhn8zRx8Cfd0v0cYQg.jpeg'),
                            // ),
                            InkWell(onTap: (){
                              _getFromGallery();
                            },
                                child: Image.asset("assets/images/edit.png"))),
                  ]),
                  const SizedBox(
                    height: 13,
                  ),
                  // Container(
                  //     height: 150.0,
                  //     width: 150.0,
                  //     child: Padding(
                  //         padding: EdgeInsets.all(15),
                  //         child: CircleAvatar(
                  //           backgroundColor: Colors.transparent,
                  //           radius: 10,
                  //           child: new Image.asset('assets/images/p.png'),
                  //         )),
                  //     decoration: new BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       border: new Border.all(
                  //         color: Colors.indigo,
                  //         width: 2.0,
                  //       ),
                  //     )
                  // ),
                  const Text(
                    "Eleanor Pena",
                    style: TextStyle(
                        color: tBlack,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Tf(hintText: "Eleanor Pena",),

                  const SizedBox(
                    height: 10,
                  ),
                  const Tf(hintText: "EleanorPena@gmail.com",),
                  const SizedBox(
                    height: 10,
                  ),
                  const Tf(hintText: "+91154654654",),


                  const SizedBox(
                    height: 30,
                  ),
                  const RoundedButton(btname: "Create"),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     left: ScreenUtil().setWidth(24),
                  //     right: ScreenUtil().setWidth(24),
                  //   ),
                  //   child: Container(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       child: Padding(
                  //         padding: EdgeInsets.only(
                  //             bottom: ScreenUtil().setHeight(17),
                  //             top: ScreenUtil().setHeight(16)),
                  //         child: Text(
                  //           "Create",
                  //           style: TextStyle(
                  //             color: const Color(
                  //               0xffFFFFFF,
                  //             ),
                  //             fontWeight: FontWeight.w700,
                  //             fontSize: ScreenUtil().setSp(16),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () async {
                  //         // if (_formKey.currentState!.validate()==true)
                  //         //  {
                  //         // loginRequest(
                  //         //     await  usernameController.text, passwordController.text);
                  //         // Navigator.push(
                  //         //   context,
                  //         //   MaterialPageRoute(builder: (context) =>  Dealers()),
                  //         // );
                  //         //  print('Successfully ');
                  //         //   }
                  //       },
                  //       //  if (_formKey.currentState?.validate() == false)
                  //       style: ElevatedButton.styleFrom(
                  //         primary: Color(0xff178E6A),
                  //         onPrimary: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ));
  }
}
