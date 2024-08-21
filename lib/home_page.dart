import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sushi/cart_page.dart';
import 'package:sushi/constants.dart';
import 'package:sushi/models.dart';
import 'package:sushi/profile_page.dart';
import 'package:sushi/sushi_item_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<SushiItem> sushiItems = [
    SushiItem(
        icon: 'assets/images/gunkanmaki-ikura.png',
        name: 'Gunkanmaki Ikura',
        price: 2.0),
    SushiItem(
        icon: 'assets/images/gunkanmaki-kappa.png',
        name: 'Gunkanmaki Kappa',
        price: 2.0),
    SushiItem(
        icon: 'assets/images/gunkanmaki-tekka.png',
        name: 'Gunkanmaki Tekka',
        price: 2.0),
    SushiItem(
        icon: 'assets/images/gunkanmaki-uni.png',
        name: 'Gunkanmaki Uni',
        price: 2.0),
    SushiItem(
        icon: 'assets/images/nigiri-amaebi.png',
        name: 'Nigiri Amaebi',
        price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-ebi.png', name: 'Nigiri Ebi', price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-hotate.png',
        name: 'Nigiri Hotate',
        price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-ika.png', name: 'Nigiri Ika', price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-maguro.png',
        name: 'Nigiri Maguro',
        price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-sake.png', name: 'Nigiri Sake', price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-shimesaba.png',
        name: 'Nigiri Shimesaba',
        price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-tai.png', name: 'Nigiri Tai', price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-tako.png', name: 'Nigiri Tako', price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-tamago.png',
        name: 'Nigiri Tamago',
        price: 1.5),
    SushiItem(
        icon: 'assets/images/nigiri-unagi.png',
        name: 'Nigiri Unagi',
        price: 1.5),
    SushiItem(icon: 'assets/images/sashimi.png', name: 'Sashimi', price: 5.0),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: _selectedIndex == 0
            ? SushiItemList(sushiItems: sushiItems)
            : _selectedIndex == 1
                ? CartPage()
                : ProfilePage(),
      ),
      bottomNavigationBar: CrystalNavigationBar(
        outlineBorderColor: kPurpleColor.withOpacity(0.4),
        curve: Curves.bounceInOut,
        backgroundColor: kPurpleColor,
        items: [
          CrystalNavigationBarItem(
              icon: Icons.home,
              selectedColor: kRoseQuartzColor,
              unselectedColor: Colors.white),
          CrystalNavigationBarItem(
              icon: Icons.shopping_basket_rounded,
              selectedColor: kRoseQuartzColor,
              unselectedColor: Colors.white),
          CrystalNavigationBarItem(
              icon: Icons.person,
              selectedColor: kRoseQuartzColor,
              unselectedColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
