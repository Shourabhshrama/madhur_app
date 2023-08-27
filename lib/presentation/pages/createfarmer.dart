import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:intl/intl.dart';

import '../widgets/btn.dart';
import 'details.dart';
import 'newmeeting.dart';
import 'neworder.dart';

class CreateFarmer extends StatefulWidget {
  const CreateFarmer({Key? key,required this.name}) : super(key: key);
 final String name;
  @override
  State<CreateFarmer> createState() => _CreateFarmerState();
}

class _CreateFarmerState extends State<CreateFarmer> {
  var time =DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) =>
       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Text(
           widget.name,
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
          actions:  [
            InkWell(onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Details()),
              );
            },
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0,right: 25),
                  child: const Text('Details',style: TextStyle( color: const Color(0xff178E6A)

                  ),
                  ),
                ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff178E6A)
                    // color: Colors.red
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 13,
                          ),
                          Image.asset(
                            "assets/images/m.png",
                            // height: ScreenUtil().setHeight(200),
                            // width: ScreenUtil().setWidth(203),
                            fit: BoxFit.cover,
                          ),
                          Container(
                            child: Text("Follow -up Meeting"),
                          ),
                          Spacer(
                          ),
                          Text(' ${time.day} -${time.month}- ${time.year}  |${time.hour}:${time.minute}',
                            style: TextStyle(color: Color(0xffF1B03C), fontSize: 15),
                          )

                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 0, right: 6,bottom: 5 ),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),SizedBox(height: 30,),
              Row(
                children: [
                  const SizedBox(
                    width: 13,
                  ),
                  Image.asset(
                    "assets/images/m.png",
                    // height: ScreenUtil().setHeight(200),
                    // width: ScreenUtil().setWidth(203),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Last Meeting"),
                  const Spacer(),

                  Container(
                    height: 29,
                    width: 81,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffDCDCDC), //color of border
                          width: 1, //width of border
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child:  Center(
                        child: Text('07-06-2023',
                      style: TextStyle(color: Color(0xffF1B03C), fontSize: 15),
                    )
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/images/n.svg",
                    // height: ScreenUtil().setHeight(120),
                    // width: ScreenUtil().setWidth(390),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("Meeting Notes"),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8)
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 6, bottom: 32),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8)
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 6, bottom: 32),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8)
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 6, bottom: 32),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8)
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 6, bottom: 32),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 19.0,
                  right: 21,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffF8F8F8)
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 8, right: 6, bottom: 32),
                        child: Column(
                          children: const [
                            Text(
                                "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
                            Text("Date: 25-06-2023")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 13,
                  ),
                  Btn(btntext: "New Order",callback: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewOrder()),
                    );
                  },),
                  // ElevatedButton(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //         left: ScreenUtil().setHeight(30),
                  //         right: ScreenUtil().setHeight(30),
                  //         bottom: ScreenUtil().setHeight(12),
                  //         top: ScreenUtil().setHeight(12)),
                  //     child: Text(
                  //       "New Order",
                  //       style: TextStyle(
                  //         color: const Color(
                  //           0xffFFFFFF,
                  //         ),
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: ScreenUtil().setSp(16),
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () async {
                  //     // if (_formKey.currentState!.validate()==true)
                  //     //  {
                  //     // loginRequest(
                  //     //     await  usernameController.text, passwordController.text);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const NewOrder()),
                  //     );
                  //     //  print('Successfully ');
                  //     //   }
                  //   },
                  //   //  if (_formKey.currentState?.validate() == false)
                  //   style: ElevatedButton.styleFrom(
                  //     primary: const Color(0xff178E6A),
                  //     onPrimary: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 7,
                  ),

                  Btn(btntext: "New Meeting",btncolor: const Color(0xffF1B03C),
                    callback: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewMeeting()),
                    );
                  },),
                  // ElevatedButton(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //         left: ScreenUtil().setHeight(30),
                  //         right: ScreenUtil().setHeight(30),
                  //         bottom: ScreenUtil().setHeight(12),
                  //         top: ScreenUtil().setHeight(12)),
                  //     child: Text(
                  //       "New Meeting",
                  //       style: TextStyle(
                  //         color: const Color(
                  //           0xffFFFFFF,
                  //         ),
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: ScreenUtil().setSp(16),
                  //       ),
                  //     ),
                  //   ),
                  //   onPressed: () async {
                  //     // if (_formKey.currentState!.validate()==true)
                  //     //  {
                  //     // loginRequest(
                  //     //     await  usernameController.text, passwordController.text);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const NewMeeting()),
                  //     );
                  //     //  print('Successfully ');
                  //     //   }
                  //   },
                  //   //  if (_formKey.currentState?.validate() == false)
                  //   style: ElevatedButton.styleFrom(
                  //     primary: const Color(0xffF1B03C),
                  //     onPrimary: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
