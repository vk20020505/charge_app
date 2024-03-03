import 'package:charge_app/screens/chargerPage.dart';
import 'package:charge_app/screens/offerPage.dart';
import 'package:charge_app/screens/settingPage.dart';
import 'package:flutter/material.dart';

import 'models/nav_model.dart';
import 'nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final chargerNavKey = GlobalKey<NavigatorState>();
  final offerNavKey = GlobalKey<NavigatorState>();
  final settingNavKey = GlobalKey<NavigatorState>();

  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      NavModel(page: const OfferPage(), navKey: offerNavKey),
      NavModel(page: const ChargerPage(), navKey: chargerNavKey),
      NavModel(page: const SettingPage(), navKey: settingNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        persistentFooterAlignment: AlignmentDirectional.bottomEnd,
        // resizeToAvoidBottomInset: false,
        body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: IndexedStack(
              index: selectedTab,
              children: items
                  .map((page) => Navigator(
                        key: page.navKey,
                        onGenerateInitialRoutes: (navigator, initialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.page),
                          ];
                        },
                      ))
                  .toList()),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}
