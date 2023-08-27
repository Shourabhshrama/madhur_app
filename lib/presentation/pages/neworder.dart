import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../widgets/roundedbutton.dart';


class NewOrder extends StatefulWidget {
  const NewOrder({Key? key}) : super(key: key);

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  bool checkbox=false;
  bool checkbox1=false;
  bool checkbox2=false;
  bool checkbox3=false;
  bool checkbox4=false;
  bool checkbox5=false;

  String dropdownvalue = 'select Quantity';
  String dropdownvalue1 = 'select Dealer';

  // List of items in our dropdown menu
  var items = [
    'select Quantity',
    '10',
    '50',
    '100',
    '200',
  ];
  var items1 = [
    'select Dealer',
    'Mohan',
    'Sohan',
    'Ram',
    'Syam',
  ];

  TextEditingController dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "New Order",
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 25.0, right: 32, top: 21),
              //   child: DropdownButton(
              //     isExpanded: true,
              //     hint: const Text('Select Quantity'),
              //     // Initial Value
              //     value: dropdownvalue,
              //
              //     // Down Arrow Icon
              //     icon: const Icon(Icons.keyboard_arrow_down),
              //
              //     // Array list of items
              //     items: items.map((String items) {
              //       return DropdownMenuItem(
              //         value: items,
              //         child: Text(items),
              //       );
              //     }).toList(),
              //     // After selecting the desired option,it will
              //     // change button value to selected value
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         dropdownvalue = newValue!;
              //       });
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 32, top: 21),
                child: DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Dealer'),
                  // Initial Value
                  value: dropdownvalue1,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

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
              // Padding(
              //   padding: const EdgeInsets.only(left: 19.0, right: 21),
              //   child: TextFormField(
              //     enabled: true,
              //     // maxLength: 10,
              //     // textInputAction: TextInputAction.next,
              //     controller: dateInputController,
              //     keyboardType: TextInputType.none,
              //     onTap: () async {
              //       DateTime? pickedDate = await showDatePicker(
              //           context: context,
              //           initialDate: DateTime.now(),
              //           firstDate: DateTime(1950),
              //           lastDate: DateTime(2050));
              //
              //       if (pickedDate != null) {
              //         dateInputController.text =
              //             DateFormat('dd MMMM yyyy').format(pickedDate);
              //       }
              //     },
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(5)),
              //         hintText: 'Delivery Date',
              //         suffixIcon: const Icon(
              //           Icons.calendar_month,
              //           color: Color(0xffF1B03C),
              //         ),
              //         contentPadding: const EdgeInsets.symmetric(
              //             horizontal: 12, vertical: 11),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(5),
              //           borderSide: const BorderSide(
              //             color: Colors.black12,
              //             width: 1.0,
              //           ),
              //         ),
              //         fillColor: const Color(0xffF9F9F9),
              //         filled: true),
              //   ),
              // ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
      SizedBox(width: 120,),
      Container(
          height: 40,width:50,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),

           //   labelText: 'Kg',
              // hintText: dataList [index].unit,
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

            // checkBoxListTileModel[index].controller,
            onChanged: (text) {

              //  setState(() {
              text  = text ;
              // FocusScope.of(context).nextFocus();
              print(text);
              // });
            },
          ),
      ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
              ),

              const SizedBox(
                height: 20,
              ),       Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox1,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox1 = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
                  SizedBox(width: 120,),
                  Container(
                    height: 40,width:50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        //   labelText: 'Kg',
                        // hintText: dataList [index].unit,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                      // checkBoxListTileModel[index].controller,
                      onChanged: (text) {

                        //  setState(() {
                        text  = text ;
                        // FocusScope.of(context).nextFocus();
                        print(text);
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox2,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox2 = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
                  SizedBox(width: 120,),
                  Container(
                    height: 40,width:50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        //   labelText: 'Kg',
                        // hintText: dataList [index].unit,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                      // checkBoxListTileModel[index].controller,
                      onChanged: (text) {

                        //  setState(() {
                        text  = text ;
                        // FocusScope.of(context).nextFocus();
                        print(text);
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox3,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox3 = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
                  SizedBox(width: 120,),
                  Container(
                    height: 40,width:50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        //   labelText: 'Kg',
                        // hintText: dataList [index].unit,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                      // checkBoxListTileModel[index].controller,
                      onChanged: (text) {

                        //  setState(() {
                        text  = text ;
                        // FocusScope.of(context).nextFocus();
                        print(text);
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
              ), const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox4,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox4 = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
                  SizedBox(width: 120,),
                  Container(
                    height: 40,width:50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        //   labelText: 'Kg',
                        // hintText: dataList [index].unit,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                      // checkBoxListTileModel[index].controller,
                      onChanged: (text) {

                        //  setState(() {
                        text  = text ;
                        // FocusScope.of(context).nextFocus();
                        print(text);
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
              ),SizedBox(height: 20,),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Color(0xffF1B03C),
                    value: checkbox5,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox5 = value!;
                      });
                    },
                  ),
                  Text("Lorem Ipsum"),
                  SizedBox(width: 120,),
                  Container(
                    height: 40,width:50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),

                        //   labelText: 'Kg',
                        // hintText: dataList [index].unit,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      //onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

                      // checkBoxListTileModel[index].controller,
                      onChanged: (text) {

                        //  setState(() {
                        text  = text ;
                        // FocusScope.of(context).nextFocus();
                        print(text);
                        // });
                      },
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("Kg")
                ],
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
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(5)),
                      hintText: 'Notes/ description',
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
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Grand Total:"),SizedBox(width: 25,),
                  Text("₹ 2250.00")
                ],
              ),const SizedBox(
                height: 20,
              ),
              RoundedButton(
                btname: "Submit",
                callback: () {},
              ), SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom))

            ],
          ),
        ),
      ),
    );
  }
}
