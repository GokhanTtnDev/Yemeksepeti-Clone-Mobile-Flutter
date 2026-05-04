import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/home_app_bar_delegate.dart';
import 'widgets/home_components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  static const double _snapPoint  = 140.0;
  static const double _snapRadius = 65.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeSnap() {
    if (!_scrollController.hasClients) return;
    final double offset = _scrollController.offset;
    final double lower  = _snapPoint - _snapRadius;
    final double upper  = _snapPoint + _snapRadius;

    if (offset >= lower && offset <= upper) {
      final double target = (offset < _snapPoint) ? 0.0 : _snapPoint + _snapRadius;
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 340),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    final List<Map<String, String>> mockRestaurants = [
      {'title': 'GokhanTtnBurger', 'imagePath': 'assets/burger1.png'},
      {'title': 'GTC', 'imagePath': 'assets/tavuklogo.png'},
      {'title': 'Gokhan Pizza', 'imagePath': 'assets/gokhanpizza.png'},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            Future.delayed(const Duration(milliseconds: 60), _maybeSnap);
          }
          return false;
        },
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HomeAppBarDelegate(topPadding: topPadding),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CategoryRow(),
                      const SizedBox(height: 24),
                      const FoodCategoryRow(),
                      const SectionHeader(title: 'Yeniden sipariş ver'),
                      SizedBox(
                        height: 310,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mockRestaurants.length,
                          itemBuilder: (context, index) => RestaurantCard(
                            title: mockRestaurants[index]['title']!,
                            imagePath: mockRestaurants[index]['imagePath']!,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      const CampaignBannersList(),
                      const SizedBox(height: 32),
                      const DiscountedProductsSection(),
                      const PopularBrandsSection(),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}