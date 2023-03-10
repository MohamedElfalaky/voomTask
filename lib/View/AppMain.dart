import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voom_task/View/AllAuctionScreen.dart';
import 'package:voom_task/View/MyAuctionScreen.dart';
import 'package:voom_task/style/icons_file.dart';

class AppMain extends StatefulWidget {
  const AppMain({
    super.key,
  });

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const MyAuctionScreen(),
    const AllAuctionScreen(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, // hide keyboard on tap anywhere

      child: Scaffold(

          //body
          body: IndexedStack(index: currentIndex, children: screens),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            heroTag: "btn1",
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          //bottom nav bar

          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias, // تصميم مكان الفاب
            notchMargin: 6, // نوتش للفاب
            child: BottomNavigationBar(
              unselectedItemColor: Colors.white70,
              selectedItemColor: Colors.white,
              // showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline),
                    label: "My Auctions"),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.people),
                    icon: Icon(Icons.people_outline),
                    label: "All Auctions"),
              ],
            ),
          )),
    );
  }
}
