import 'dart:async';

import 'package:charge_app/controller/viewChanger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Utils/route.dart';
import 'detailsOage.dart';

class ChargerPage extends StatefulWidget {
  const ChargerPage({super.key});

  @override
  State<ChargerPage> createState() => _ChargerPageState();
}

class _ChargerPageState extends State<ChargerPage> {
  viewChanger changeMethod = Get.put(viewChanger());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: Stack(
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black,
                ),
                const Text('airCharge'),
                Card(
                  // margin: ,
                  // elevation: 15,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Container(
                    width: double.maxFinite,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8)),
                          prefixIconColor: Colors.black,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          hintStyle:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                          hintText: 'Search charging public location'),
                    ),
                    // child: Center(child: Text('Offers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Obx(
          () => Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .8,
                width: MediaQuery.sizeOf(context).width,
                // color: Colors.blue,

                color: Colors.white,
                child: changeMethod.viewControl.value
                    ? const GoogleMap(
                        zoomControlsEnabled: false,
                        myLocationEnabled: false,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(28.535517, 77.391029), zoom: 14),
                      )
                    : Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: Colors.grey.shade100,
                      ),
              ),
              Container(
                // height: double.maxFinite,
                height: 25,
                color: Colors.white,
              ),
              Positioned(
                // bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      // elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 160,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: Center(
                            child: Row(
                          children: [
                            Image.asset('assets/images/location.png', width: 25, height: 25, color: Colors.green.shade300,),
                            // Icon(Icons.arrow_circle_up_sharp),
                            const Text(
                              ' Current Location',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                    Card(
                      // elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: InkWell(
                        onTap: () {
                          changeMethod.changeView();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white),
                          child: Center(
                              child: changeMethod.viewControl.value
                                  ? const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.menu),
                                        Text(
                                          '  List View',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.sailing),
                                        Text(
                                          '  Map View',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      

              Positioned(
                bottom: changeMethod.viewControl.value ? .1 : 0,
                // top: 20,
                height: changeMethod.viewControl.value
                    ? MediaQuery.sizeOf(context).height * .3
                    : MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width,
                // bottom: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  width: double.maxFinite,
                  // color: Colors.red,
                  child: const listName(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class listName extends StatelessWidget {
  const listName({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1.5,
          child: ListTile(
            onTap: () {
  

              Navigator.of(context).push(createRoute(DetailPage()));
            },
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            minLeadingWidth: 25,
            // tileColor: Colors.amber,
            trailing: const Icon(Icons.arrow_forward_ios),
            leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/starbuckslogo.png')),
            title: const Text(
              'Starbucks',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            subtitle: const Text(
              'Southern row\n2.5 miles',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
