import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/task.dart';
import '../widgets/roundedbutton.dart';
import 'createfarmer.dart';




class DailyReminder extends StatefulWidget {
  DailyReminder({Key? key, }) : super(key: key);
  ///late String text;
  @override
  State<DailyReminder> createState() => _DailyReminderState();
}

class _DailyReminderState extends State<DailyReminder> {



//  List<Task> task = List.empty(growable: true);
  List<Task>foundTask=[];
  //time show
  var time = DateTime.now();

  TextEditingController searchcontroller = TextEditingController();
  String search = '';
  String name='';

  List<String> names = [
    "Savannah Nguyen",
    "Annette Black",
    "Jerome Bell",
    "Ronald Richards",
    "Darrell Steward",
    "Cameron Williamson",
    "Robert Fox"
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
  void initState() {
    super.initState();
   //foundTask= names ;
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "12-12-2023",
                  style: const TextStyle(color: Colors.black),
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
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 19.0, right: 21),
                    child: TextFormField(
                      controller: searchcontroller,
                      decoration: InputDecoration(

                          //  border: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.white54,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(5)),
                          hintText: 'Search',
                          suffixIcon: searchcontroller.text.length > 0
                              ? IconButton(
                                  onPressed: () {
                                    searchcontroller.clear();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.cancel,
                                      color: Colors.grey))
                              : null,

                          // IconButton(
                          //   onPressed: (){
                          //     setState((){
                          //    search=   searchcontroller.clear();
                          //     });
                          //   },
                          //
                          //   icon: const Icon(Icons.clear,color: Colors.grey,),
                          // ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 11),
                          fillColor: Colors.black12,
                          filled: true),
                      onChanged: (String? value) {
                        print(value);
                        setState(() {
                          search = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //       itemCount: task.length,
                  //       itemBuilder: (context, index) {
                  //         late String position = task[index].today;
                  //         // late String position = task[index].today;
                  //         print(task.length);
                  //         if (searchcontroller.text.isEmpty) {
                  //           return InkWell(
                  //             onTap: () {
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => CreateFarmer()),
                  //               );
                  //             },
                  //             child: ListTile(
                  //                 leading:
                  //                     const Icon(Icons.person_outline_rounded),
                  //                 title: Text(position.toString()),
                  //                 trailing:
                  //                     Text('${DateFormat('jm').format(time)}')
                  //                 // ("${time.hour}:${time.minute}"),
                  //                 ),
                  //           );
                  //         } else if (position
                  //             .toLowerCase()
                  //             .contains(searchcontroller.text.toLowerCase())) {
                  //           return ListTile(
                  //             title: Text(position),
                  //             onTap: () {
                  //               searchcontroller.text = position;
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => CreateFarmer()),
                  //               );
                  //             },
                  //           );
                  //         } else {
                  //           return Container();
                  //         }
                  //       }),
                  // ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          late String position = names[index].toString();
                          if (searchcontroller.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateFarmer(name: position,)),
                                );
                              },
                              child: ListTile(
                                  leading:
                                  const Icon(Icons.person_outline_rounded),
                                  title: Text(position.toString()),
                                  trailing: Text('${DateFormat('jm').format(time)}')
                                // ("${time.hour}:${time.minute}"),
                              ),
                            );
                          } else if (position
                              .toLowerCase()
                              .contains(searchcontroller.text.toLowerCase())) {
                            return ListTile(
                              title: Text(position),
                              onTap: () {
                                searchcontroller.text = position;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreateFarmer(name: position,)),
                                );
                              },
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  RoundedButton(
                    btname: "Create",
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateFarmer(name: name,)),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  )
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
                ],
              ),
            ));
  }
}
