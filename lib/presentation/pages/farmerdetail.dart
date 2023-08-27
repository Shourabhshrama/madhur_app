import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerDetail extends StatefulWidget {
  const FarmerDetail({Key? key}) : super(key: key);

  @override
  State<FarmerDetail> createState() => _FarmerDetailState();
}

class _FarmerDetailState extends State<FarmerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 37,
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
                        child: Text("Name:"),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text("Darrell Steward")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Father’s Name:"),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Text("Elenor Peena")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Mobile No. :"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("+91154654654")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Address:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          "Ut enim ad minima veniam, \nquis nostrum exercita tionem \nullam ")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 17,),
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
              Text("Farm Details")
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
                        child: Text("Type of cattle:"),
                      ),
                      SizedBox(
                        width: 27,
                      ),
                      Text("Cow, Goat, Poultry, Pig")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("No. of cattle:"),
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      Text("200")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Brand of feed\n used:"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("Brand 1, Brand 2, Brand 3,\nBrand 4")
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Feed \nConsumption:"),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                          "100 kg")
                    ],
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Dealer:"),
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      Text(
                          "Jenny Wilson, Esther Howard")
                    ],
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Madhur Feed:"),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                          "Yes")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
