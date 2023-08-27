import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madhur_app/core/constant/colors.dart';
import 'package:madhur_app/presentation/pages/farmerdetail.dart';
import 'package:madhur_app/presentation/pages/orderhistory.dart';


class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Farmer Details and Order History",
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
        body: SafeArea(
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Builder(// Add this
                builder: (context) {
              return Column(
                children:  [
                  TabBar(
                    indicatorColor: Colors.white54,
                    unselectedLabelColor: tBlack,
                    // controller: DefaultTabController.of(context),
                    labelColor: Color(0xffF1B03C),
                    tabs: [
                      Tab(text: 'Farmer Details'),
                      Tab(text: 'Order History'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                       FarmerDetail(),
                        OrderHistory()

                      ],
                    ),
                  ),

                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
