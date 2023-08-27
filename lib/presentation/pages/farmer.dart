import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';
import '../widgets/bttn.dart';
import 'createfarmer.dart';
import 'newformer.dart';


class Farmer extends StatefulWidget {
  const Farmer({Key? key}) : super(key: key);

  @override
  State<Farmer> createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  // String dropdownvalue = 'Select Location';
  //String dropdownvalue1 = 'Select country 1';
  String dropdownvalue4 = 'Area    ';
  String dropdownvalue1 = 'state    ';
  String dropdownvalue2 = 'city     ';
  String dropdownvalue3 = 'village   ';
  String dropdownvalue5 = 'Select Farmers';

  // List of items in our dropdown menu
  var items = [
    'Area    ',
    'Area1',
    'Area2',
    'Area3',
    'Area4',
  ];
  // var items1 = [
  //   'Select country 1',
  //   'Select country 2',
  //   'Select country 3',
  //   'Select country 4',
  //   'Select country 5',
  // ];
  var items2 = [
    'state    ',
    'state1',
    'state2',
    'state3',
    'state4',
  ];
  var items3 = [
    'village   ',
    'village1',
    'village2',
    'village3',
    'village4',
  ];
  var items4 = [
    'Select Farmers',
    'Savannah Nguyen',
    'Annette Black',
    'Jerome Bell',
    'Ronald Richards',
  ];
  var items5 = [
    'city     ',
    'city1',
    'city2',
    'city3',
    'city4',
  ];

  TextEditingController searchcontroller = TextEditingController();
  String search = '';

  List<String> names = [
    "Savannah Nguyen",
    "Annette Black",
    "Jerome Bell",
    "Ronald Richards",
    "Darrell Steward",
    "Cameron Williamson",
    "Robert Fox"
  ];
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
            "Farmers",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Bttn(
              btntext: "Add New Farmer",
              callback: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewFormer()),
                );
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         primary: const Color(0xffF1B03C),
            //         onPrimary: Colors.white,
            //         // shadowColor: Colors.greenAccent,
            //         // elevation: 3,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(5.0)),
            //         minimumSize: const Size(70, 30), //////// HERE
            //       ),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const NewFormer()),
            //         );
            //       },
            //       child: const Text("Add New Farmer")),
            // )
          ],
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                Text(
                  "Select Location ",
                  style: TextStyle(
                      color: tBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: DropdownButton(
            //    // isExpanded: true,
            //     hint: const Text('Select country'),
            //     // Initial Value
            //     value: dropdownvalue2,
            //
            //     // Down Arrow Icon
            //     icon: const Icon(Icons.keyboard_arrow_right),
            //
            //     // Array list of items
            //     items: items1.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(items),
            //       );
            //     }).toList(),
            //     // After selecting the desired option,it will
            //     // change button value to selected value
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownvalue2 = newValue!;
            //       });
            //     },
            //   ),
            // ),
            SizedBox(height: 20,),
            Wrap(
              spacing: 20,
              children: [

                // Padding(
                //   padding: const EdgeInsets.only(left: 18.0, right: 18),
                //   child: DropdownButton(
                //     //  isExpanded: true,
                //     hint: const Text('city'),
                //     // Initial Value
                //     value: dropdownvalue2,
                //
                //     // Down Arrow Icon
                //     icon: const Icon(Icons.keyboard_arrow_down),
                //
                //     // Array list of items
                //     items: items5.map((String items) {
                //       return DropdownMenuItem(
                //         value: items,
                //         child: Text(items),
                //       );
                //     }).toList(),
                //     // After selecting the desired option,it will
                //     // change button value to selected value
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         dropdownvalue2 = newValue!;
                //       });
                //     },
                //   ),
                // ),


                // Container(
                //   height: 35,
                //   width: 153,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //       border: Border.all(color: Color(0xffF9F9F9))),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 8.0),
                //     child: DropdownButton(underline: Container(),
                //       isExpanded: true,
                //       isDense: false,
                //       hint: const Text('state'),
                //       // Initial Value
                //       value: dropdownvalue1,
                //
                //       // Down Arrow Icon
                //       icon: const Icon(Icons.keyboard_arrow_down),
                //
                //       // Array list of items
                //       items: items1.map((String items) {
                //         return DropdownMenuItem(
                //           value: items,
                //           child: Text(items),
                //         );
                //       }).toList(),
                //       // After selecting the desired option,it will
                //       // change button value to selected value
                //       onChanged: (String? newValue) {
                //         setState(() {
                //           dropdownvalue1 = newValue!;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, ),
                  child: Container(
                    height: 41,
                    width: 143,
                    decoration: BoxDecoration( color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xffF9F9F9))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0,),
                      child: DropdownButton(underline: Container(),
                        isExpanded: true,
                        hint: const Text('village'),
                        // Initial Value
                        value: dropdownvalue3,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( right: 11),
                  child: Container(
                    height: 41,
                    width: 143,
                    decoration: BoxDecoration( color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xffF9F9F9))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 1),
                      child: DropdownButton(underline: Container(),
                        isExpanded: true,
                        hint: const Text(
                          'Area',
                          style: TextStyle(
                              color: tBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        // Initial Value
                        value: dropdownvalue4,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

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
                            dropdownvalue4 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                Text(
                  "Farmers ",
                  style: TextStyle(
                      color:tBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 18.0,right: 18),
            //   child: DropdownButton(
            //     isExpanded: true,
            //     //hint: const Text('Select Farmer'),
            //     // Initial Value
            //     value: dropdownvalue5,
            //
            //     // Down Arrow Icon
            //     icon: const Icon(Icons.keyboard_arrow_down),
            //
            //     // Array list of items
            //     items: items4.map((String items) {
            //       return DropdownMenuItem(
            //         value: items,
            //         child: Text(items),
            //       );
            //     }).toList(),
            //     // After selecting the desired option,it will
            //     // change button value to selected value
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         dropdownvalue5 = newValue!;
            //       });
            //     },
            //     onTap: () {
            //       // if (dropdownvalue5 != null) {
            //       //   Navigator.push(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //         builder: (context) => const CreateFarmer()),
            //       //   );
            //       // }
            //       // else{
            //       //   if(dropdownvalue5!=null ){
            //       //     Navigator.push(
            //       //       context,
            //       //       MaterialPageRoute(builder: (context) =>  CreateFarmer()),
            //       //     );
            //       //   }
            //       // }
            //     },
            //   ),
            // ),
            SizedBox(
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
                    hintText: 'Search or select farmer',
                    helperStyle: const TextStyle(
                      color: tBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    suffixIcon: searchcontroller.text.length > 0
                        ? IconButton(
                            onPressed: () {
                              searchcontroller.clear();
                              setState(() {});
                            },
                            icon: const Icon(Icons.cancel, color: Colors.grey))
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
            Expanded(
              //  height: 500,
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
                                builder: (context) => CreateFarmer(name: position,)),
                          );
                        },
                        child: ListTile(
                          leading: const Icon(Icons.person_outline_rounded),
                          title: Text(position.toString()),
                        ),
                      );
                    } else if (position
                        .toLowerCase()
                        .contains(searchcontroller.text.toLowerCase())) {
                      return ListTile(
                        title: Text(position),
                        onTap: () {
                          searchcontroller.text = position;
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
