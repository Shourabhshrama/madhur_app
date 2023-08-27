import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:math' as math;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:madhur_app/core/constant/colors.dart';
import 'package:madhur_app/data/model/StateResponse.dart';
import 'package:madhur_app/data/session/SessionManager.dart';
import 'package:madhur_app/domain/entities/task.dart';
import 'package:madhur_app/presentation/bloc/locationBloc/LocationBloc.dart';
import 'package:madhur_app/presentation/pages/LoginScreen.dart';
import 'package:madhur_app/presentation/pages/profile.dart';

import '../../data/model/CountryResponse.dart';
import '../bloc/locationBloc/LocationEvent.dart';
import '../bloc/locationBloc/LocationState.dart';
import 'allorder.dart';
import 'dailyreminder.dart';
import 'details.dart';
import 'farmer.dart';

class Homescreen extends StatelessWidget {
  List<Task> task = List.empty(growable: true);
  final TextEditingController todaycontroller = TextEditingController();
  String dropdownvalue1 = 'State';
  String dropdownvalue2 = 'City';

  Future<String> _loadSavedName() async {
    String? name = await SessionManager().getString("name");

    return name ?? 'NA';
  }

  var items2 = [
    'City',
    'city1',
    'city2',
    'city3',
    'city4',
  ];

  int _selected = 0;

  void changeSelected(int index) {}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      // setState(() {
      //   imageFile = File(pickedFile.path);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              key: _scaffoldKey,
              drawer: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
                child: Stack(children: [
                  Image.asset(
                    "assets/images/ms.png",
                    height: ScreenUtil().setHeight(825),
                    width: ScreenUtil().setWidth(375),
                    fit: BoxFit.cover,
                  ),
                  ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.account_circle_outlined,
                            size: 50,
                            color: Color(0xffFFFFFF),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          FutureBuilder<String>(
                              future: _loadSavedName(),
                              builder: (context, snapShot) {
                                return Container(
                                  child: Text(
                                    "Hello ${snapShot.data ?? ''}",
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                );
                              })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          selected: _selected == 0,
                          horizontalTitleGap: 1.0,
                          leading: Icon(
                              //Icons.keyboard_arrow_right,
                              Icons.home,
                              color: _selected == 0
                                  ? const Color(0xffF1B03C)
                                  : const Color(0xffFFFFFF)),
                          title: Text(
                            'Home',
                            style: TextStyle(
                                color: _selected == 0
                                    ? const Color(0xffF1B03C)
                                    : const Color(0xffFFFFFF),
                                fontSize: 14),
                          ),
                          onTap: () {
                            changeSelected(0);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          selected: _selected == 1,
                          horizontalTitleGap: 1.0,
                          leading: Icon(
                            Icons.person,
                            color: _selected == 1
                                ? const Color(0xffF1B03C)
                                : const Color(0xffFFFFFF),
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(
                                color: _selected == 1
                                    ? const Color(0xffF1B03C)
                                    : const Color(0xffFFFFFF)),
                          ),
                          onTap: () {
                            changeSelected(1);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          selected: _selected == 5,
                          horizontalTitleGap: 1.0,
                          leading: Icon(Icons.contact_page,
                              color: _selected == 5
                                  ? const Color(0xffF1B03C)
                                  : const Color(0xffFFFFFF)),
                          title: Text(
                            'Orders',
                            style: TextStyle(
                                color: _selected == 5
                                    ? const Color(0xffF1B03C)
                                    : const Color(0xffFFFFFF)),
                          ),
                          onTap: () {
                            changeSelected(5);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AllOrder()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: ListTile(
                          selected: _selected == 6,
                          horizontalTitleGap: 1.0,
                          // selectedTileColor: Color(0xffF1B03C),
                          // selectedColor: Color(0xffF1B03C),
                          leading: Icon(Icons.logout,
                              color: _selected == 6
                                  ? const Color(0xffF1B03C)
                                  : const Color(0xffFFFFFF)),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                color: _selected == 6
                                    ? const Color(0xffF1B03C)
                                    : const Color(0xffFFFFFF)),
                          ),
                          onTap: () async {
                            var sharedPref = await SessionManager().clear();
                            changeSelected(6);
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(children: [
                    Positioned(
                        top: 40,
                        right: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff1D926F)),
                              child: const Icon(
                                Icons.close,
                                size: 32,
                                color: Colors.white,
                              )),
                        )),
                  ]),
                ]),
              ),
              // appBar: AppBar(),
              body: SingleChildScrollView(
                child: Column(children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/mask.png",
                        width: double.infinity,
                        height: ScreenUtil().setHeight(381),
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(19),
                        top: ScreenUtil().setHeight(60),
                        child: InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: SvgPicture.asset(
                            "assets/images/Group 12.svg",
                            // height: ScreenUtil().setHeight(120),
                            // width: ScreenUtil().setWidth(390),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(298),
                        top: ScreenUtil().setHeight(68),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
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
                        ),
                        // SvgPicture.asset(
                        //   "assets/images/p.svg",
                        //   // height: ScreenUtil().setHeight(120),
                        //   // width: ScreenUtil().setWidth(390),
                        //   //fit: BoxFit.cover,
                        // ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: ScreenUtil().setWidth(79),
                        // top: ScreenUtil().setHeight(60),
                        child: SvgPicture.asset(
                          "assets/images/Vector.svg",
                          // height: ScreenUtil().setHeight(120),
                          // width: ScreenUtil().setWidth(390),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: ScreenUtil().setWidth(200),
                        // top: ScreenUtil().setHeight(60),
                        child: SvgPicture.asset(
                          "assets/images/v.svg",
                          // height: ScreenUtil().setHeight(120),
                          // width: ScreenUtil().setWidth(390),
                          //fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          // bottom: 0,
                          left: ScreenUtil().setWidth(18),
                          top: ScreenUtil().setHeight(121),
                          child: FutureBuilder(
                              future: _loadSavedName(),
                              builder: (context, snapshot) {
                                return Text(
                                  "Hi, Welcome \n${snapshot.data ?? ''}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600),
                                );
                              })),
                      Positioned(
                          left: 19,
                          top: 200,
                          bottom: 76,
                          child: Container(
                            width: 334,
                            height: 41,
                            child: Stack(children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 324,
                                  height: 41,
                                  child: TextFormField(
                                    // maxLength: 10,
                                    // textInputAction: TextInputAction.next,
                                    controller: todaycontroller,
                                    // keyboardType: TextInputType.name,

                                    decoration: InputDecoration(
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        hintText: 'Today’s Reminder',
                                        prefixIcon: const Icon(
                                          Icons.notifications_none,
                                          size: 20,
                                          color: Color(0xffF1B03C),
                                        ),
                                        // arrow_drop_down_circle
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            // String reminder=todaycontroller.text;
                                            // if(reminder.isNotEmpty){
                                            //   setState((){
                                            //     todaycontroller.text='';
                                            //     task.add(Task(today: reminder));
                                            //   });
                                            // }
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DailyReminder()),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                          color: Color(0xffF1B03C),
                                        ),
                                        // suffixIcon: IconButton(
                                        //   onPressed: () {},
                                        //   icon: const Icon(
                                        //     Icons.arrow_forward_ios_outlined,
                                        //     size: 20,
                                        //     color: Color(0xffF1B03C),
                                        //   ),
                                        // ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 13, vertical: 5),
                                        // enabledBorder: OutlineInputBorder(
                                        //   borderRadius: BorderRadius.circular(5),
                                        //   borderSide: const BorderSide(
                                        //     color: Colors.black12,
                                        //     width: 1.0,
                                        //   ),
                                        // ),
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                ),
                              ),
                            ]),
                          )),
                      Positioned(
                        left: 20,
                        top: 250,
                        //bottom: 76,
                        child: Container(
                          height: 35,
                          width: 153,
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xffF9F9F9))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: BlocBuilder<StateBloc, StateState>(
                              
                              builder: (context, state) {

                                if (state is LocationLoading) {
                                  return CircularProgressIndicator();
                                } else if (state is LocationLoaded) {
                                  final selectedState = context.watch<StateBloc>().selectedState; // Read selected state
                                  final stateResponse = state.response;
                                  final states = stateResponse.data;
                                  return DropdownButton<StateModel>(
                                    value: selectedState,
                                    onChanged: (newValue) {
                                      // Update the selected state using the BLoC
                                      context.read<StateBloc>().add(StateSelectedEvent(newValue!));
                                    },
                                    items: states.map((state) {
                                      return DropdownMenuItem<StateModel>(
                                        value: state,
                                        child: Text(state.name),
                                      );
                                    }).toList(),
                                  );
                                } else if (state is LocationLoadingFailed) {
                                  return Text('Failed to load data: ${state.error}');
                                } else {
                                  return const SizedBox(); // Handle other states if needed
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 190,
                        top: 250,
                        //bottom: 76,
                        child: Container(
                          height: 35,
                          width: 153,
                          decoration: BoxDecoration(
                              color: Color(0xffF9F9F9),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xffF9F9F9))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton(
                              underline: Container(),
                              isExpanded: true,

                              hint: const Text('city'),
                              // Initial Value
                              child: BlocBuilder<StateBloc, StateState>(
                                builder: (context, state) {
                                  if (state is LocationLoading) {
                                    return CircularProgressIndicator();
                                  } else if (state is LocationLoaded) {
                                    final selectedState = context.watch<StateBloc>().selectedState; // Read selected state
                                    final stateResponse = state.response;
                                    final states = stateResponse.data;
                                    return DropdownButton<StateModel>(
                                      value: selectedState,
                                      onChanged: (newValue) {
                                        // Update the selected state using the BLoC
                                        context.read<StateBloc>().add(StateSelectedEvent(newValue!));
                                      },
                                      items: states.map((state) {
                                        return DropdownMenuItem<StateModel>(
                                          value: state,
                                          child: Text(state.name),
                                        );
                                      }).toList(),
                                    );
                                  } else if (state is LocationLoadingFailed) {
                                    return Text('Failed to load data: ${state.error}');
                                  } else {
                                    return const SizedBox(); // Handle other states if needed
                                  }
                                },
                              ),
                              onChanged: (String? newValue) {
                                // setState(() {
                                //   dropdownvalue2 = newValue!;
                                // });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 18.0, right: 18),
                  //   child: DropdownButton(
                  //     //   isExpanded: true,
                  //
                  //     hint: const Text('state'),
                  //     // Initial Value
                  //     value: dropdownvalue1,
                  //
                  //     // Down Arrow Icon
                  //     icon: const Icon(Icons.keyboard_arrow_down),
                  //
                  //     // Array list of items
                  //     items: items2.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //       );
                  //     }).toList(),
                  //     // After selecting the desired option,it will
                  //     // change button value to selected value
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         dropdownvalue1 = newValue!;
                  //       });
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: ScreenUtil().setHeight(127),
                    width: ScreenUtil().setWidth(334),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 4,
                            offset: Offset(3, 2),
                            spreadRadius: 0,
                          )
                        ],
                        border: Border.all(
                          color: const Color(0xFFE7E7E7),
                          width: 0.50,
                        ),
                        color: const Color(0xffFFFFFF)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(27),
                                  left: ScreenUtil().setWidth(15),
                                  //right: ScreenUtil().setWidth(16),
                                  //bottom: ScreenUtil().setHeight(19),
                                ),
                                child: Text(
                                  "Monthly Target",
                                  style: TextStyle(
                                      color: tBlack,
                                      fontSize: ScreenUtil().setSp(21),
                                      fontWeight: FontWeight.w600),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(27),
                                  //left: ScreenUtil().setWidth(55),
                                  right: ScreenUtil().setWidth(9),
                                  //bottom: ScreenUtil().setHeight(19),
                                ),
                                child: Text(
                                  "375/500",
                                  style: TextStyle(
                                      color: tBlack,
                                      fontSize: ScreenUtil().setSp(21),
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Image.asset(
                            'assets/images/li.png',
                            height: 20,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "2nd Milestone Achieved",
                            style: TextStyle(
                                color: tBlack,
                                fontSize: ScreenUtil().setSp(14),
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      changeSelected(0);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Farmer()),
                      );
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(127),
                      width: ScreenUtil().setWidth(334),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 4,
                            offset: Offset(3, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: _selected == 0
                            ? const Color(0xFF1D926F)
                            : const Color(0xffFFFFFF),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(19),
                              left: ScreenUtil().setWidth(19),
                              //right: ScreenUtil().setWidth(16),
                              bottom: ScreenUtil().setHeight(19),
                            ),
                            child: Stack(children: [
                              Container(
                                height: ScreenUtil().setHeight(101),
                                width: ScreenUtil().setWidth(98),
                                decoration: const BoxDecoration(
                                  color: Color(0xffF1B03C),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/images/path.png'),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Farmers",
                                style: TextStyle(
                                    color: _selected == 0
                                        ? const Color(0xffFFFFFF)
                                        : tBlack,
                                    // color: const Color(0xff1F2C37),
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      changeSelected(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Details()),
                      );
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(127),
                      width: ScreenUtil().setWidth(334),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C000000),
                            blurRadius: 4,
                            offset: Offset(3, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: _selected == 1
                            ? const Color(0xFF1D926F)
                            : const Color(0xffFFFFFF),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setHeight(19),
                              left: ScreenUtil().setWidth(19),
                              // right: ScreenUtil().setWidth(16),
                              bottom: ScreenUtil().setHeight(15),
                            ),
                            child: Stack(children: [
                              Container(
                                height: ScreenUtil().setHeight(101),
                                width: ScreenUtil().setWidth(98),
                                decoration: const BoxDecoration(
                                  color: Color(0xffF1B03C),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/hand.png',
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dealers",
                                style: TextStyle(
                                    color: _selected == 1
                                        ? const Color(0xffFFFFFF)
                                        : tBlack,
                                    //  color: const Color(0xff1F2C37),
                                    fontSize: ScreenUtil().setSp(18),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ]),
              ),
            ));
  }
}
