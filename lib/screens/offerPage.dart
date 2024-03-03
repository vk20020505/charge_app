
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Map<String, String>> sliderContents = [
    {'image': 'assets/images/starbucks.jpg'},
    {'image': 'assets/images/starbucks.jpg'},
    {'image': 'assets/images/starbucks.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 155,
            // color: Colors.blue,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              //  fit: StackFit.passthrough,
              // overflow: Overflow.visible,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.black,
                    ),
                    const Text(
                      'airCharge',
                      style: TextStyle(fontSize: 20),
                    ),
                    Card(
                      // elevation: 15,
                      margin: const EdgeInsets.only(top: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                          'Offers',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 30,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                Positioned(
                  // top: 10,
                  // bottom: 1,
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 0, left: 2, right: 2),
                    // elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.maxFinite,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: const Center(
                          child: Text(
                        'All list are shown in the list below have wireless chargers installed on the premises',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        carouselController: _controller,
                        options: CarouselOptions(
                            // pauseAutoPlayInFiniteScroll: true,
                            height: 120.0,
                            viewportFraction: 1,
                            autoPlay: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: sliderContents.map(
                          (data) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(data['image']!),
                                        fit: BoxFit.cover)),
                              );
                            });
                          },
                        ).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliderContents.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 7.0,
                                height: 7.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Text(
                        'Browse Nearby Offers',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: () {
                             

                              },
                              child: Container(
                                // height: 150,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(7),
                                              topRight: Radius.circular(7)),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/meal.jpg'))),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 8.0, left: 8),
                                      child: Text(
                                        'McDonalds - Leicester Square',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, left: 8),
                                      child: Text('Offer 1',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
