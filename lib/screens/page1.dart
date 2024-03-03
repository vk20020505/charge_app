import 'package:charge_app/screens/page2.dart';
import 'package:charge_app/screens/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int index = 0;

  List pages = [
    Page3(),
    Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Container(
        //   color: Colors.blue,
        //   height: 50,
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: InkWell(
        //           onTap: () {
        //             setState(() {
        //               index = 0;
        //             });
        //           },
        //           child: Container(
        //               alignment: Alignment.center,
        //               height: 50,
        //               color: Colors.green,
        //               child: Text("page1")),
        //         ),
        //       ),
        //       Expanded(
        //         child: InkWell(
        //           onTap: () => setState(() {
        //             index = 1;
        //           }),
        //           child: Container(
        //               alignment: Alignment.center,
        //               height: 50,
        //               color: Colors.red,
        //               child: Text("page2")),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        body: Stack(
      children: [
        pages[index],
        Container(
          color: Colors.blue,
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: Colors.green,
                      child: Text("page1")),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => setState(() {
                    index = 1;
                  }),
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      color: Colors.red,
                      child: Text("page2")),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
