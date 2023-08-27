import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'package:custom_switch/custom_switch.dart';

import '../widgets/tf.dart';
import 'create.dart';
import 'newfarmer1.dart';

class NewFormer extends StatefulWidget {
  const NewFormer({Key? key}) : super(key: key);

  @override
  State<NewFormer> createState() => _NewFormerState();
}

class _NewFormerState extends State<NewFormer> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController searchcontroller = TextEditingController();
  String search = '';

  // bool isSwitched = false;
  // String dropdownvalue = 'Select Brand';
  // String dropdownvalue1 = "Feed Consumption Per Month";
  // String dropdownvalue2 = "Dealer";
  // String dropdownvalue3 = "Product Bought";
  //
  // var items = [
  //   'Select Brand',
  //   'Select Brand 2',
  //   'Select Brand 3',
  //   'Select Brand 4',
  //   'Select Brand 5',
  // ];
  // var items1 = [
  //   'Feed Consumption Per Month',
  //   '200',
  //   '300',
  //   '400',
  //   '500',
  // ];
  // var items2 = [
  //   'Dealer',
  //   'Ram',
  //   'Raj',
  //   'Mohan',
  //   'sohan',
  // ];
  // var items3 = [
  //   'Product Bought',
  //   'Product Bought 2',
  //   'Product Bought 3',
  //   'Product Bought 4',
  //   'Product Bought 5',
  // ];
  var currentStep=0;
  // var selectedIndexes = [];
  // bool _checkbox = false;
  // List<String> names = ["Cow", "Buffalo", "Goat", "Poultry", "Fish", "Pigs"];


  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
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
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          //controller: ScrollController(),
          // physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              
              Container(
                height: 100,width: 200,
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
                  type:StepperType.horizontal ,
                  currentStep:currentStep,
                  onStepTapped: (index){
                    setState((){
                      currentStep=index;
                    });
                  },
                  steps: [
                    Step(isActive: currentStep>=0,
                        title: Text("",), content: Text("")),
                    Step(
                        title: Text(""), content: Text(""))
                  ],),
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
             // ),
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

              // const SizedBox(
              //   height: 10,
              // ),
              // const Tf(
              //   hintText: "Select State",
              // ),

              const SizedBox(
                height: 10,
              ),
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
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(5)),
                      hintText: 'Enter Address Details Here',
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
                height: 22,
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
                        "Next",
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
                        MaterialPageRoute(builder: (context) => NewFarmer1()),
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
      ),
    );
  }
}
