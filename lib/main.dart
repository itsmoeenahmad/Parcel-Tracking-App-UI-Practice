//Parcel Tracker Project in flutter

// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Parcel-Tracker-Project",
    home: home_page(),
  ));
}

class home_page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => home_page_State();
}

class home_page_State extends State<home_page> {
  bool result = false;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 15,
        ),
        Lottie.network(
            'https://lottie.host/b385e5fa-9f67-4b0d-87b4-787370af74ad/lYpGz1x02V.json'),
        SizedBox(
          height: 15,
        ),
        Text(
          "Parcel Tracker",
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "ENTER THE TRACKING NUMBER",
                      prefixIcon: Icon(Icons.numbers_sharp),
                      prefixIconColor: Colors.black,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      result = true;
                    });
                  },
                  child: Icon(
                    Icons.search,
                    size: 30,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        result
            ? Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Text(
                      "Result : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 210,
                    ),
                    Icon(Icons.close),
                  ],
                ),
              )
            : SizedBox(
                height: 10,
              ),
        result
            ? Expanded(
                child: Stepper(
                  currentStep: _index,
                  onStepCancel: () {
                    setState(() {
                      _index -= 1;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      _index += 1;
                    });
                    if (_index == 5) {
                      _index = 0;
                    }
                  },
                  onStepTapped: (int index) {
                    setState(() {
                      _index = ++index;
                    });
                  },
                  steps: <Step>[
                    Step(
                      isActive: _index > 0,
                      title: const Text('Ordered Placed'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('12:30 PM , 16/08/2023'),
                      ),
                    ),
                    Step(
                      isActive: _index > 1,
                      title: const Text('Dispatch in progress'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('12:35 PM , 16/08/2023'),
                      ),
                    ),
                    Step(
                      isActive: _index > 2,
                      title: const Text('Ready for pickup'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('01:00 PM , 16/08/2023'),
                      ),
                    ),
                    Step(
                      isActive: _index > 3,
                      title: const Text('In Transit'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('01:20 PM , 16/08/2023'),
                      ),
                    ),
                    Step(
                      isActive: _index >= 4,
                      title: const Text('Out For Delivery'),
                      content: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('01:30 PM , 16/08/2023'),
                      ),
                    ),
                  ],
                ),
              )
            : Expanded(
                child: Lottie.network(
                    'https://lottie.host/6bfc001d-55cd-4897-b763-07a9abc8b18e/X8dhMTOmXI.json'),
              ),
      ]),
    );
  }
}
