import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:e_commerce/pages/product/favorites.dart';
import 'package:e_commerce/pages/product/list.dart';
import 'package:e_commerce/pages/profile/profile_page.dart';
import 'package:e_commerce/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;

  Widget showpage(index) {
    if (index == 1) {
      return const FavoriteProducts();
    }
    if (index == 2) {
      return const ProfilePage();
    }

    return const ProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: scaffoldBlack,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: showpage(index),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: index,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.1),
          outlineBorderColor: Colors.black.withOpacity(0.1),
          onTap: (i) => setState(() {
            index = i;
          }),
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: primaryYellow,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),

            /// Profile
            CrystalNavigationBarItem(
              icon: IconlyBold.user2,
              unselectedIcon: IconlyLight.user2,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
