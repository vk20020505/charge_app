import 'package:flutter/material.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
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
              width: 25,
              image: AssetImage('assets/images/mcdonalds.png'),
              // size: 15,
            ),
            Text(
              '  McDonalds',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 300,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/meal.jpg'))),
            ),
            const SizedBox(
                child: Text(
              "Turn next Monday into a McDonald's Monday!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
                child: Text(
              "Expanded offer items",
              style: TextStyle(
                fontSize: 16,
              ),
            )),
            const Expanded(child: SizedBox()),
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text('Offer ends: 12/10/2023'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize: const Size(double.maxFinite, 60)),
                onPressed: () {},
                child: const Text(
                  'Redeem',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
