import 'package:charge_app/screens/itemDetails.dart';
import 'package:flutter/material.dart';

import '../Utils/route.dart';

class ItemsOfferPage extends StatefulWidget {
  const ItemsOfferPage({super.key});

  @override
  State<ItemsOfferPage> createState() => _ItemsOfferPageState();
}

class _ItemsOfferPageState extends State<ItemsOfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 30,
        leading: IconButton(onPressed: (){
                        Navigator.pop(context);

        }, icon:  const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            )),
     
        title: const Row(
          children: [
            Image(
              width: 25,
          image:
          AssetImage('assets/images/mcdonalds.png'),
          // size: 15,
        ),
            Text(
              '  McDonalds',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top:8.0, bottom: 8),
            child: Text('Offer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
             
        Navigator.of(context).push(createRoute(ItemDetailsPage()));
               
                },
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    height: 130,
                    
                    padding: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 100,
                          // height: 100,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/meal.jpg')),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
              
                              child: Text("Turn next Monday into a\n McDonald's Monday!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                            Text(" McDonald's Monopoly is back !\n Peel. Play. Win?", style: TextStyle(fontSize: 15, ),),
                            Expanded(child: SizedBox()),
                            Text('Offer ends: 12/10/2023')
                          ],
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
    );
  }
}
