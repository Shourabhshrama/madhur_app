import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../core/constant/colors.dart';
import 'create.dart';
import 'createfarmer.dart';

class NewFarmer1 extends StatefulWidget {
  const NewFarmer1({Key? key}) : super(key: key);

  @override
  State<NewFarmer1> createState() => _NewFarmer1State();
}

class _NewFarmer1State extends State<NewFarmer1> {
  bool isSwitched = false;
  String dropdownvalue = 'Select Brand';
  String dropdownvalue1 = "Feed Consumption Per Month";
  String dropdownvalue2 = "Dealer";
  String dropdownvalue3 = "Product Bought";

  var items = [
    'Select Brand',
    'Select Brand 2',
    'Select Brand 3',
    'Select Brand 4',
    'Select Brand 5',
  ];
  var items1 = [
    'Feed Consumption Per Month',
    '200',
    '300',
    '400',
    '500',
  ];
  var items2 = [
    'Dealer',
    'Ram',
    'Raj',
    'Mohan',
    'sohan',
  ];
  var items3 = [
    'Product Bought',
    'Product Bought 2',
    'Product Bought 3',
    'Product Bought 4',
    'Product Bought 5',
  ];

  var currentStep = 0;
  var selectedIndexes = [];
  bool _checkbox = false;
  List<String> names = ["Cow", "Buffalo", "Goat", "Poultry", "Fish", "Pigs"];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  "New Farmer",
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

                    Container(
                      height: 100,
                      width: 200,
                      child: Stepper(
                        onStepContinue: () {
                          setState(() {
                            currentStep += 1;
                          });
                        },
                        onStepCancel:(){
                          setState(() {
                            currentStep -= 1;
                          });
                        } ,
                        type: StepperType.horizontal,
                        currentStep: currentStep,
                        onStepTapped: (index) {
                          setState(() {
                            currentStep = index;
                          });
                        },
                        steps: [
                          Step(
                              // state: currentStep > 0 ? StepState.complete : StepState.indexed,
                              isActive: currentStep >= 0,
                              title: Text(""),
                              content: Text("content")),
                          Step(
                              isActive: true,
                              title: Text(""),
                              content: Text("content"))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.person_pin,
                          color: Color(0xffF1B03C),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Type Of Cattle")
                      ],
                    ),

                    Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: Color(0xffF9F9F9),
                      ),
                      child: ListView.builder(
                          itemCount: names.length,
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              activeColor: const Color(0xffF1B03C),
                              title: Text(names[index]),
                              value: selectedIndexes.contains(index),
                              onChanged: (bool? newValue) {
                                setState(
                                  () {
                                    if (selectedIndexes.contains(index)) {
                                      selectedIndexes.remove(index); // unselect
                                    } else {
                                      selectedIndexes.add(index); // select
                                    }
                                  },
                                  //       _checkbox = newValue!;
                                  // }
                                );
                              },
                              // trailing:  Checkbox(
                              //
                              //   value: _checkbox,
                              //   onChanged: (value) {
                              //     setState(() {
                              //       _checkbox = !_checkbox;
                              //     });
                              //   },
                              // ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        " No. Of Cattle -${selectedIndexes.length.toString()}"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Which Brand OF Feed Do You Use For Your Cattle?",
                      style: TextStyle(color: Color(0xffF1B03C)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'Select Brand',
                          style: TextStyle(
                              color: tBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_right),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'Select Brand',
                          style: TextStyle(
                              color: tBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        // Initial Value
                        value: dropdownvalue1,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_right),

                        // Array list of items
                        items: items1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue1 = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'Select Brand',
                          style: TextStyle(
                              color: tBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        // Initial Value
                        value: dropdownvalue2,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_right),

                        // Array list of items
                        items: items2.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Text(
                          'Select Brand',
                          style: TextStyle(
                              color: tBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        // Initial Value
                        value: dropdownvalue3,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_right),

                        // Array list of items
                        items: items3.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue3 = newValue!;
                          });
                        },
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 19.0, right: 21),
                    //   child: TextFormField(
                    //     // maxLength: 10,
                    //     textInputAction: TextInputAction.next,
                    //     // controller: usernameController,
                    //     keyboardType: TextInputType.name,
                    //     decoration: InputDecoration(
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(5)),
                    //         hintText: 'Select Brand',suffixIcon: Icon(Icons.arrow_forward_ios),
                    //         contentPadding:
                    //         EdgeInsets.symmetric(horizontal: 8, vertical: 11),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(5),
                    //           borderSide: const BorderSide(
                    //             color: Colors.black12,
                    //             width: 1.0,
                    //           ),
                    //         ),
                    //         fillColor: Color(0xffF9F9F9),
                    //         filled: true),
                    //
                    //   ),
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: 'Average Quantity Bought Per Month?',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 11),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: const Text(
                            "Is The Dealer Reliable?",
                            style: TextStyle(color: Color(0xffF1B03C)),
                          ),
                        ),
                        Switch(
                          // This bool value toggles the switch.
                          value: isSwitched,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                        // CustomSwitch(
                        //   value: isSwitched,
                        //   activeColor: Color(0xff1D926F),
                        //   onChanged: (value) {
                        //     print("VALUE : $value");
                        //     setState(() {
                        //       isSwitched = value;
                        //     });
                        //   },
                        // ),

                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 21),
                      child: TextFormField(
                        // maxLength: 10,
                        //  textInputAction: TextInputAction.next,
                        // controller: usernameController,
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(5)),
                            hintText: 'Create Dealer',
                            suffixIcon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Create()),
                                );
                              },
                              icon: Icon(Icons.add),
                              color: Color(0xffF1B03C),
                            ),
                            // Icon(
                            //   Icons.add,
                            //   color: Color(0xffF1B03C),
                            // ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 11),
                            // enabledBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(5),
                            //   borderSide: const BorderSide(
                            //     color: Colors.black12,
                            //     width: 1.0,
                            //   ),
                            // ),
                            fillColor: Colors.black12,
                            filled: true),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter email address';
                        //   }
                        //   return null;
                        // },
                        //(v) => validateMobile(v!),
                        // onChanged: (val) {
                        //   mobilenumber = val;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(24),
                        right: ScreenUtil().setWidth(24),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(17),
                                top: ScreenUtil().setHeight(16)),
                            child: Text(
                              "Create Farmer",
                              style: TextStyle(
                                color: const Color(
                                  0xffFFFFFF,
                                ),
                                fontWeight: FontWeight.w700,
                                fontSize: ScreenUtil().setSp(16),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()==true)
                            //  {
                            // loginRequest(
                            //     await  usernameController.text, passwordController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateFarmer(name: "",)),
                            );
                            //  print('Successfully ');
                            //   }
                          },
                          //  if (_formKey.currentState?.validate() == false)
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff178E6A),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
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
