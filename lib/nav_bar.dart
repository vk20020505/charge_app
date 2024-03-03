import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navItem('assets/images/tag.png', 'Offers', pageIndex == 0,
                onTap: () => onTap(0)),
            navItem(
              'assets/images/electricity.png',
              'Find Chargers',
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
            navItem('assets/images/settings.png', 'Settings', pageIndex == 2,
                onTap: () => onTap(2)),
          ],
        ),
      ),
    );
  }

  Widget navItem(String path, String label, bool selected,
      {Function()? onTap}) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            path,
            height: 25,
            width: 25,
            color: selected ? Colors.black : Colors.black.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.black : Colors.black.withOpacity(0.4),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
