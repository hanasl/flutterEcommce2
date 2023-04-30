import 'package:e_commerce/constance.dart';
import 'package:e_commerce/screen/Cart.dart';
import 'package:e_commerce/screen/Post.dart';
import 'package:e_commerce/screen/Profil.dart';

import 'package:e_commerce/screen/homescreen.dart';
import 'package:e_commerce/screen/postt.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _buildScreens() {
      return [
        homeScreen(),
        CartScreen(),
        postSCreen(),
        // PostScreen(),
        ProfilScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'asset/home.png',
            fit: BoxFit.contain,
            width: 20,
          ),
          title: ("Home"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.accessibility_new),
          title: ("Panier"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          title: ("Post"),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          iconSize: 28,
          icon: Icon(Icons.person),
          title: ("Profil"),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return Scaffold(
        body: PersistentTabView(
      context,
      navBarHeight: 55,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.grey.shade50,
      //Color.fromARGB(255, 219, 216, 231),
      // Color.fromARGB(255, 159, 139, 167),
      //, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        colorBehindNavBar: Colors.red,
        //border: Border.all(color: Colors.black26)
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style14, // Choose the nav bar style with this property.
    ));
  }
}
