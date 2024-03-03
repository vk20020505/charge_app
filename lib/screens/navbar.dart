import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

import "../Utils/custom_navbar2.dart";
import "../Utils/custom_navbar3.dart";

// void main() => runApp(const MyApp());

BuildContext? testContext;

class MainMenu2 extends StatefulWidget {
  const MainMenu2({final Key? key}) : super(key: key);

  @override
  _MainMenu2State createState() => _MainMenu2State();
}

class _MainMenu2State extends State<MainMenu2> {
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
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: const Text("Built-in styles example"),
                onPressed: () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: ProvidedStylesExample(
                    menuScreenContext: context,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

// ----------------------------------------- Provided Style ----------------------------------------- //

class ProvidedStylesExample extends StatefulWidget {
  const ProvidedStylesExample({final Key? key, this.menuScreenContext})
      : super(key: key);
  final BuildContext? menuScreenContext;

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  PersistentTabController? _controller;
  bool? _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar!,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar!;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar!,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar!;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar!,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar!;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar!,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar!;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext!,
          hideStatus: _hideNavBar!,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar!;
            });
          },
        ),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
            title: "Home",
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: "Search",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const MainScreen2(),
              "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: "Add",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const MainScreen2(),
              "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          title: "Messages",
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const MainScreen2(),
              "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: "Settings",
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const MainScreen2(),
              "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Navigation Bar Demo")),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("This is the Drawer"),
              ],
            ),
          ),
        ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          onWillPop: (final context) async {
            await showDialog(
              context: context!,
              useSafeArea: true,
              builder: (final context) => Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            return false;
          },
          selectedTabScreenContext: (final context) {
            testContext = context;
          },
          backgroundColor: Colors.black,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style19, // Choose the nav bar style with this property
        ),
      );
}

// ----------------------------------------- Custom Style ----------------------------------------- //

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget(
    this.items, {
    final Key? key,
    this.selectedIndex,
    this.onItemSelected,
  }) : super(key: key);
  final int? selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int>? onItemSelected;

  Widget _buildItem(
          final PersistentBottomNavBarItem item, final bool isSelected) =>
      Container(
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: 26,
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary ?? item.activeColorPrimary),
                child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                  item.title!,
                  style: TextStyle(
                      color: isSelected
                          ? (item.activeColorSecondary ??
                              item.activeColorPrimary)
                          : item.inactiveColorPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                )),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(final BuildContext context) => Container(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((final item) {
              final int index = items.indexOf(item);
              return Flexible(
                child: GestureDetector(
                  onTap: () {
                    onItemSelected!(index);
                  },
                  child: _buildItem(item, selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      );
}
