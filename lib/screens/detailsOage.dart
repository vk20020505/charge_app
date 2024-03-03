import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.red,
              ))
        ],
        leadingWidth: 25,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            )),
        title: const Row(
          children: [
            Image(
              width: 35,
              image: AssetImage('assets/images/starbuckslogo.png'),
              // size: 15,
            ),
            Text(
              ' Southern Row',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .28,

              // margin: EdgeInsets.only(right: 5),
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/restautrant.jpg')),
                  borderRadius: BorderRadius.circular(7)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Starbucks',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Temporarily Closed',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
            const Text(
              '150 Russell square \n Southern Row London\n 2.4 miles',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text('Google Review Score',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                      size: 40,
                    ),
                    const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                      size: 40,
                    ),
                    const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                      size: 40,
                    ),
                    const Icon(
                      Icons.star_rate,
                      color: Colors.amber,
                      size: 40,
                    ),
                    Icon(
                      Icons.star_rate,
                      color: Colors.grey.shade300,
                      size: 40,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.grey.shade300,
                      fixedSize: const Size(double.maxFinite, 60)),
                  onPressed: () {},
                  child: const Text(
                    'DownLoad the App',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
            ),
            Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.grey.shade300,
                      fixedSize: const Size(double.maxFinite, 60)),
                  onPressed: () {},
                  child: const Text(
                    'See Offers',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
            ),
            Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color.fromARGB(255, 93, 239, 100),
                      fixedSize: const Size(double.maxFinite, 60)),
                  onPressed: () {},
                  child: const Text(
                    'Navigate',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
