import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_tab.dart';
import 'package:ecommerce/features/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce/features/profile/presentation/widgets/profile_tab.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const WishlistTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      extendBody: false,
      body: tabs[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(15),
          topEnd: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => changeSelectedIndex(value),
          backgroundColor: ColorManager.primary,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            CustomBottomNavBarItem(IconsAssets.home, 'Home'),
            CustomBottomNavBarItem(IconsAssets.category, 'Categories'),
            CustomBottomNavBarItem(IconsAssets.wishlist, 'WishList'),
            CustomBottomNavBarItem(IconsAssets.profile, 'Profile'),
          ],
        ),
      ),
    );
  }

  void changeSelectedIndex(int selectedIndex) =>
      setState(() => currentIndex = selectedIndex);
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  final String iconPath;
  final String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            radius: 12,
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.primary,
              size: 14,
            ),
          ),
        );
}
