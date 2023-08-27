import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madhur_app/presentation/widgets/tf.dart';

import '../widgets/roundedbutton.dart';


class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "New Dealer",
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
              body: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.person,
                          color: Color(0xffF1B03C),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Details")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Tf(
                      hintText: 'Name',
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 19.0, right: 21),
                    //   child: TextFormField(
                    //     // maxLength: 10,
                    //     textInputAction: TextInputAction.next,
                    //     // controller: usernameController,
                    //     keyboardType: TextInputType.name,
                    //     decoration: const InputDecoration(
                    //         border: InputBorder.none,
                    //         // border: OutlineInputBorder(
                    //         //     borderRadius: BorderRadius.circular(5)),
                    //         hintText: 'Name',
                    //         contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 12, vertical: 11),
                    //         // enabledBorder: OutlineInputBorder(
                    //         //   borderRadius: BorderRadius.circular(5),
                    //         //   borderSide: const BorderSide(
                    //         //     color: Colors.black12,
                    //         //     width: 1.0,
                    //         //   ),
                    //         // ),
                    //         fillColor: Colors.black12,
                    //         filled: true),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Tf(
                      hintText: "Mobile Number",
                    ),

                    const SizedBox(
                      height: 19,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.add_location,
                          color: Color(0xffF1B03C),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Address")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Tf(
                    //   hintText: "Select Country",
                    // ),
                    //
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const Tf(
                    //   hintText: "Select State",
                    // ),
                    //
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const Tf(
                      hintText: "Select City",
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Tf(
                      hintText: 'Select Village',
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    const Tf(
                      hintText: "Enter Block",
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        // maxLength: 10,
                        textInputAction: TextInputAction.done,
                        // controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(5)),
                            hintText: 'Enter Address Details Here',
                            contentPadding: const EdgeInsets.only(
                                left: 8.0, bottom: 70, top: 5),
                           // isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.white54,
                                width: 1.0,
                              ),
                            ),
                            fillColor: Colors.black12,
                            filled: true),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundedButton(
                      btname: "Create Dealer",
                      callback: () {},
                    ),

                    // Creating a Custom Widget in Flutter - Complete Tutorial
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
                    //           "Create Dealer",
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
                    //         //   MaterialPageRoute(builder: (context) => CreateFarmer()),
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
                    const SizedBox(
                      height: 27,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ));
  }
}
