import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  final int selected;
  final Function(int)? tap;

  MyNavBar({this.selected = 0, this.tap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selected,
      onTap: tap,
      backgroundColor: Colors.grey[200],
      fixedColor: Colors.green[600],
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: 'Contacts',
          icon: Icon(Icons.contact_page),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}


// class MyNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//   final List<IconData> items;
//   const MyNavBar(
//       {Key? key,
//       this.currentIndex = 0,
//       required this.onTap,
//       required this.items})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[200],
//       height: 120,
//       child: Row(
//         children: getItems(),
//       ),
//     );
//   }

//   List<Widget> getItems() {
//     List<Widget> toReturn = [];
//     for (var i = 0; i < items.length; i++) {
//       toReturn.add(Expanded(
//         child: Center(
//           child: IconButton(
//               onPressed: () {
//                 onTap(i);
//                 // print("You tapped: $i");
//               },
//               icon: Icon(items[i],
//                   color: i == currentIndex ? Colors.green : Colors.grey)),
//         ),
//       ));
//     }
//     return toReturn;
//   }
// }
