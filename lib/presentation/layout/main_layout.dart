import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_screen.dart';
import '../market/market_layout.dart';
import '../arama/arama_layout.dart';
import '../sepet/sepet_layout.dart';
import '../profile/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          const MarketLayout(),
          const AramaLayout(),
          const SepetLayout(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryRed,
        unselectedItemColor: AppColors.textLight,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Yemek'),
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: 'Marketler'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Arama'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Sepetler'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Hesabım'),
        ],
      ),
    );
  }
}