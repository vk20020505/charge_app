import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // bool forIos1 = false;
  //  bool forIos2 = false;
    List <Map> name = [
    {'title':'Low power Notification', 'subtitle':'Notify me of nearby charging location', 'button':false },
        {'title':'Disable notification on Wifi', 'subtitle':'Nearby chargers will only alert on', 'button':false },

  ];
      List <Map> name2 = [
    {'title':'Allow power monitoring', 'subtitle':'Send battery and charge data to Aircharge', 'button':false },
        {'title':'Allow location tracking', 'subtitle':'Used to show nearby chargers', 'button':false },

  ];
    List <Map> name3 = [
    {'title':'Custom Alert Radius', 'subtitle':'Only how me the nearby chargers within a distance', 'value':1.0 , 'last': 'km'},
        {'title':'Battery Percentage Alert Threshold', 'subtitle':'The battery percant at which an alert trigger', 'value':10.0, 'last': '0%' },

  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Column(children: [
                            CircleAvatar(radius: 5,backgroundColor: Colors.black,),

            Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 30),
              child: Text('airCharge'),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            Text('Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
          ]),
          centerTitle: true,
          toolbarHeight: 100,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notification Settings',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ListView.separated(
                  padding: EdgeInsets.only(left: 8,top: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      width: double.maxFinite,
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name[index]['title'],
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w400)),
                              Text(name[index]['subtitle'],
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w300))
                            ],
                          ),
                         CupertinoSwitch(
            // overrides the default green color of the track
            activeColor: Colors.green.shade300,
            // color of the round icon, which moves from right to left
            thumbColor: Colors.white,
            // when the switch is off
            trackColor: Colors.grey.shade300,
            // boolean variable value
            value: name[index]['button'],
            // changes the state of the switch
            onChanged: (value) => setState(() => name[index]['button'] = value),
          ),
                        ],
                      ),
                    );
                  },
                ),
                    Divider(
                  indent: 7,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                 ListView.separated(
                  padding: EdgeInsets.only(left: 8,top: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: name.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 90,
                      width: double.maxFinite,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name3[index]['title'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          Text(name3[index]['subtitle'],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300)),
          
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width*.8,
                                          child: Slider(
                                                                value: name3[index]['value'],
                                                                max: 10,
                                                                min: 0,
                                                                // divisions: 10,
                                                                activeColor: Colors.blue.shade900,
                                                                inactiveColor: Colors.grey,
                                                                onChanged: (value) {
                                                              setState(() {
                                                                name3[index]['value'] = value;
                                                              });
                                                                },
                                                              ),
                                        ),
                                        Text('${(name3[index]['value']).floor()}${name3[index]['last']}')
                                      ],
                                    ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(
                  indent: 7,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                 Text('Data Tracking',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ListView.separated(
                  padding: EdgeInsets.only(left: 8,top: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: name2.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      width: double.maxFinite,
                      // color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name2[index]['title'],
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w400)),
                              Text(name2[index]['subtitle'],
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w300)),
          
                                        
                            ],
                          ),
                         CupertinoSwitch(
            // overrides the default green color of the track
            activeColor: Colors.green.shade300,
            // color of the round icon, which moves from right to left
            thumbColor: Colors.white,
            // when the switch is off
            trackColor: Colors.grey.shade300,
            // boolean variable value
            value: name2[index]['button'],
            // changes the state of the switch
            onChanged: (value) => setState(() => name2[index]['button'] = value),
          ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(
                  indent: 7,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height*.1,),
                Center(
                  child: Text('Show Marker Mode',
                  // textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.grey.shade400, fontSize: 18),),
                )
              ],
            ),
          ),
        ));
  }
}
