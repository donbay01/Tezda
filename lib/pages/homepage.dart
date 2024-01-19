import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:e_commerce/pages/product/favorites.dart';
import 'package:e_commerce/pages/product/list.dart';
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

    return const ProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
              selectedColor: Colors.white,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: IconlyBold.heart,
              unselectedIcon: IconlyLight.heart,
              selectedColor: Colors.red,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: IconlyBold.plus,
              unselectedIcon: IconlyLight.plus,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
              selectedColor: Colors.white,
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
