import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../widgets/roundedbutton.dart';


class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key}) : super(key: key);

  @override
  State<NewMeeting> createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  String dropdownvalue5 = 'Select Farmers';

  var items4 = [
    'Select Farmers',
    'Savannah Nguyen',
    'Annette Black',
    'Jerome Bell',
    'Ronald Richards',
  ];
  String selecttime = 'select time';

  Future<void> _showTimePicker() async {
    final TimeOfDay? t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      setState(() {
        selecttime = t.format(context);
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
            "New Meeting",
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
          child: Column(
            children: [
              const SizedBox(
                height: 23,
              ),
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
                  Text("Create A Follow-up Meeting"),
                //  Text(selecttime)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: DropdownButton(
                  isExpanded: true,
                  //hint: const Text('Select Farmer'),
                  // Initial Value
                  value: dropdownvalue5,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items4.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue5 = newValue!;
                    });
                  },
                  onTap: () {
                    // if (dropdownvalue5 != null) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const CreateFarmer()),
                    //   );
                    // }
                    // else{
                    //   if(dropdownvalue5!=null ){
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) =>  CreateFarmer()),
                    //     );
                    //   }
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 41,
                    width: 153,
                    child: TextFormField(
                      // maxLength: 10,
                      // textInputAction: TextInputAction.next,
                      controller: dateInputController,
                      keyboardType: TextInputType.none,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            //cancelText: "submit",
                            // useRootNavigator: true,

                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          dateInputController.text =
                              DateFormat('dd MMMM yyyy').format(pickedDate);
                        }
                        // else{
                        //   Navigator.push(
                        //             context,
                        //             MaterialPageRoute(builder: (context) =>  Dealers()),
                        //           );
                        // }
                        if (pickedDate != null) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => DateCreate(
                          //             date: dateInputController.text,
                          //           )),
                          // );
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Select Date',
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            color: Color(0xffF1B03C),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 11),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.black12,
                              width: 1.0,
                            ),
                          ),
                          fillColor: const Color(0xffF9F9F9),
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  InkWell(
                    onTap: (){
                      _showTimePicker();
                    },
                    child: Container(
                      height: 40,
                      width: 163,
                      // decoration: BoxDecoration(
                      //
                      //     border: Border.all(color: Colors.grey)),
                      // child: Row(
                      //   children: [SizedBox(width: 10,),
                      //     Text(selecttime),SizedBox(width: 40,),
                      //     Icon(Icons.access_time_outlined,color:Color(0xffF1B03C) ,)
                      //   ],
                      // ),
                      child:
                      TextFormField(
                        // maxLength: 10,
                        // textInputAction: TextInputAction.next,
                      //  controller: timeInput,
                        //keyboardType: TextInputType.none,
                        onTap: () async {
                          _showTimePicker();
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: selecttime,
                            suffixIcon: const Icon(
                              Icons.access_time_outlined,
                              color: Color(0xffF1B03C),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 11),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.black12,
                                width: 1.0,
                              ),
                            ),
                            fillColor: const Color(0xffF9F9F9),
                            filled: true),
                      ),
                    ),
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
                  const Text("Note for next meeting"),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 19.0, right: 21),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  // maxLength: 10,
                  textInputAction: TextInputAction.done,
                  // controller: usernameController,
                  keyboardType: TextInputType.name,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(5)),
                      hintText: 'Type here',
                      contentPadding:
                          const EdgeInsets.only(left: 8.0, bottom: 70, top: 5),
                      isDense: true,
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
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 19.0,
              //     right: 21,
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: Color(0xffF8F8F8)
              //         // color: Colors.red
              //         ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, top: 8, right: 6, bottom: 32),
              //           child: Column(
              //             children: const [
              //               Text(
              //                   "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
              //               Text("Date: 25-06-2023")
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 19.0,
              //     right: 21,
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: const Color(0xffF8F8F8)
              //         // color: Colors.red
              //         ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, top: 8, right: 6, bottom: 32),
              //           child: Column(
              //             children: const [
              //               Text(
              //                   "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
              //               Text("Date: 25-06-2023")
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 19.0,
              //     right: 21,
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: const Color(0xffF8F8F8)
              //         // color: Colors.red
              //         ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, top: 8, right: 6, bottom: 32),
              //           child: Column(
              //             children: const [
              //               Text(
              //                   "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
              //               Text("Date: 25-06-2023")
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 19.0,
              //     right: 21,
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: const Color(0xffF8F8F8)
              //         // color: Colors.red
              //         ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, top: 8, right: 6, bottom: 32),
              //           child: Column(
              //             children: const [
              //               Text(
              //                   "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
              //               Text("Date: 25-06-2023")
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     left: 19.0,
              //     right: 21,
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: const Color(0xffF8F8F8)
              //         // color: Colors.red
              //         ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(
              //               left: 8.0, top: 8, right: 6, bottom: 32),
              //           child: Column(
              //             children: const [
              //               Text(
              //                   "Ut enim ad minima veniam, quis nostrum exercita tionem ullam corporis suscipit laborios, nisi ut al minima veniam, quis "),
              //               Text("Date: 25-06-2023")
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
              //       onPressed: () async{
              //
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
              //
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
              SizedBox(
                height: 31,
              ),
              RoundedButton(
                btname: "Set Up",
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
