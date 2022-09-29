import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/presentation/resources/asset_images.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../styles/app_colors.dart';
import '../tickets/tickets_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ref.bottomBarIndex == 1
          ? null
          : AppBar(
              title: Text(_title[ref.bottomBarIndex]),
              centerTitle: true,
            ),
      body: _tabViews[ref.bottomBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.bottomBarIndex,
        onTap: (index) => ref.setBottomBarIndex(index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetImages.homeActive),
            icon: Image.asset(AssetImages.homeInactive),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetImages.ticketsActive),
            icon: Image.asset(
              AssetImages.ticketsInactive,
              color: AppColors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(AssetImages.userActive),
            icon: Image.asset(AssetImages.userInactive),
            label: '',
          ),
        ],
      ),
    );
  }
}

List<Widget> _tabViews = [
  const HomeScreen(),
  const TicketsScreen(),
  const ProfileScreen(),
];

List<String> _title = [
  'Home',
  'Tickets',
  'Profile',
];
