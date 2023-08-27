import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madhur_app/core/constant/colors.dart';


class AllOrder extends StatefulWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  State<AllOrder> createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "All Orders",
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
            body: Column(children: [
              SizedBox(
                height: 37,
              ),

              Row(
                children: const [
                  SizedBox(
                    width: 22,
                  ),
                  Text("12-13-22"),
                  // Icon(
                  //   Icons.person,
                  //   color: Color(0xffF1B03C),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  //Text("Order History")
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 19.0, right: 22),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white60
                      // color: Colors.red
                      ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Ronald Richards"),
                          ),
                          SizedBox(
                            width: 67,
                          ),
                          Text("Order No - 45646446")
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Divider(),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Product 1"),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text("5 kg"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Product 2"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text("3 kg"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Product 3"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text("7 kg "),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0),
                            child: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                  text: 'Order Status:',
                                  style: TextStyle(
                                      color:tBlack,
                                      fontWeight: FontWeight.w400)),
                                  WidgetSpan(
                                    child: SizedBox(width: 10),
                                  ),

                                    TextSpan(
                                      text: 'Pending',
                                      style: TextStyle(
                                          color: Color(0xff1D926F),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                      // recognizer: TapGestureRecognizer()
                                      //   ..onTap = () {
                                      //     // navigate to desired screen
                                      //   }
                                    )
                                  ]),
                            ),

                          ),
                          SizedBox(
                            width: 100,
                          ),
                        //  Text("₹ 2250.00")
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 17,
              ),
              // Row(
              //   children: const [
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Icon(
              //       Icons.add_location,
              //       color: Color(0xffF1B03C),
              //     ),
              //     SizedBox(
              //       width: 5,
              //     ),
              //     Text("Farm Details")
              //   ],
              // ),
              // const SizedBox(
              //   height: 7,
              // ),
              Padding(
                  padding: const EdgeInsets.only(left: 19.0, right: 22),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white60
                        // color: Colors.red
                        ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Robert Fox"),
                            ),
                            SizedBox(
                              width: 97,
                            ),
                            Text("Order No - 45646446")
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Product 1"),
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 18.0),
                              child: Text("5 kg"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Product 2"),
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 18.0),
                              child: Text("3 kg"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Product 3"),
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Text("7 kg"),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Order Status:',
                                          style: TextStyle(
                                              color: tBlack,
                                              fontWeight: FontWeight.w400)),
                                      WidgetSpan(
                                        child: SizedBox(width: 10),
                                      ),

                                      TextSpan(
                                        text: 'Delivered',
                                        style: TextStyle(
                                            color: Color(0xff1D926F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        // recognizer: TapGestureRecognizer()
                                        //   ..onTap = () {
                                        //     // navigate to desired screen
                                        //   }
                                      )
                                    ]),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: RichText(
                            //     text: TextSpan(
                            //       text: 'Order Status:', style: TextStyle(color: Colors.black, fontSize: 18),),)
                            // ),
                            SizedBox(
                              width: 100,
                            ),
                           // Text("₹ 2250.00")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ))
            ])));
  }
}
