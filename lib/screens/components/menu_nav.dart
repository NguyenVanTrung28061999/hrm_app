import 'package:app_hrm/screens/components/home/home_component.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MenuNav extends StatefulWidget {
  const MenuNav({super.key});

  @override
  State<MenuNav> createState() => _MenuNavState();
}

class _MenuNavState extends State<MenuNav> {
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const HomeComponent(),
          ),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.blue,
          ),
          item: ItemConfig(
            icon: const Icon(Icons.message),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.green,
          ),
          item: ItemConfig(
            icon: const Icon(Icons.settings),
            title: "Settings",
          ),
        ),
        PersistentTabConfig(
          screen: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.yellow,
          ),
          item: ItemConfig(
            icon: const Icon(Icons.person_2_rounded),
            title: "Profile",
            // inactiveBackgroundColor: Colors.green,
            // activeColorSecondary: Colors.green
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}
