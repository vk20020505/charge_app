// import "package:charge_app/Utils/custom_navbar2,dart";
import "package:charge_app/Utils/custom_navbar2.dart";
import "package:charge_app/screens/page1.dart";
import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import "screens/newTab.dart";

void main() => runApp(const MyApp());

// BuildContext testContext;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: "Persistent Bottom Navigation Bar example project",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApps(),
        // initialRoute: "/",
        // routes: {
        //   // When navigating to the "/" route, build the FirstScreen widget.
        //   "/first": (final context) => const MainScreen2(),
        //   // When navigating to the "/second" route, build the SecondScreen widget.
        //   "/second": (final context) => const MainScreen3(),
        // },
      );
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Sample Project"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text("Custom widget example"),
                onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: CustomWidgetExample(
                    menuScreenContext: context,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}


// class CustomNavBarWidget extends StatelessWidget {
//   const CustomNavBarWidget(
//     this.items, {
//     required this.selectedIndex,
//     required this.onItemSelected,
//   }) ;
//   final int selectedIndex;
//   final List<PersistentBottomNavBarItem> items;
//   final ValueChanged<int> onItemSelected;

//   Widget _buildItem(
//           final PersistentBottomNavBarItem item, final bool isSelected) =>
//       Container(
//         alignment: Alignment.center,
//         height: kBottomNavigationBarHeight,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Flexible(
//               child: IconTheme(
//                 data: IconThemeData(
//                     size: 26,
//                     color: isSelected
//                         ? (item.activeColorSecondary ?? item.activeColorPrimary)
//                         : item.inactiveColorPrimary ?? item.activeColorPrimary),
//                 child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Material(
//                 type: MaterialType.transparency,
//                 child: FittedBox(
//                     child: Text(
//                   item.title,
//                   style: TextStyle(
//                       color: isSelected
//                           ? (item.activeColorSecondary ??
//                               item.activeColorPrimary)
//                           : item.inactiveColorPrimary,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 12),
//                 )),
//               ),
//             )
//           ],
//         ),
//       );

//   @override
//   Widget build(final BuildContext context) => Container(
//         color: Colors.white,
//         child: SizedBox(
//           width: double.infinity,
//           height: kBottomNavigationBarHeight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: items.map((final item) {
//               final int index = items.indexOf(item);
//               return Flexible(
//                 child: GestureDetector(
//                   onTap: () {
//                     onItemSelected(index);
//                   },
//                   child: _buildItem(item, selectedIndex == index),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
// }


