import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HomeAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;

  HomeAppBarDelegate({required this.topPadding});

  static const double _yproEnd       = 100.0;
  static const double _addressEnd    = 140.0;
  static const double _searchSnapEnd = 165.0;

  static const double _topGap    = 12.0;
  static const double _barHeight = 48.0;
  static const double _botGap    = 12.0;
  static const double _ovalH     = 20.0;

  static const double _searchCollapsedLocalTop = _topGap;
  static const double _searchInitialLocalTop = 60.0;

  @override
  double get maxExtent => topPadding + 264.0;

  @override
  double get minExtent =>
      topPadding + _topGap + _barHeight + _botGap + _ovalH;

  @override
  bool shouldRebuild(covariant HomeAppBarDelegate oldDelegate) =>
      topPadding != oldDelegate.topPadding;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double totalShrink = maxExtent - minExtent;

    final double bgP    = (shrinkOffset / totalShrink).clamp(0.0, 1.0);
    final Color bgColor =
    Color.lerp(AppColors.primaryPurple, AppColors.primaryRed, bgP)!;

    final double yproP       = (shrinkOffset / _yproEnd).clamp(0.0, 1.0);
    final double yproOpacity = 1.0 - yproP;
    final double yproTop     = topPadding + 124.0 - (yproP * 40.0);

    final double addressP =
    ((shrinkOffset - _yproEnd) / (_addressEnd - _yproEnd))
        .clamp(0.0, 1.0);
    final double addressOpacity = 1.0 - addressP;
    final double addressTop     = topPadding + 12.0 - (addressP * 10.0);

    final double snapP =
    ((shrinkOffset - _addressEnd) / (_searchSnapEnd - _addressEnd))
        .clamp(0.0, 1.0);
    final double eased = 1.0 - (1.0 - snapP) * (1.0 - snapP) * (1.0 - snapP);
    final double delta = _searchInitialLocalTop - _searchCollapsedLocalTop;
    final double searchTop =
        topPadding + _searchInitialLocalTop - (eased * delta);

    return Container(
      color: bgColor,
      child: ClipRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (yproOpacity > 0)
              Positioned(
                top: yproTop,
                left: 16,
                right: 16,
                child: Opacity(
                  opacity: yproOpacity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "♛ Gpro'da ♛",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "300 TL MegaBurger indirimi",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 21,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Text(
                                  "Gpro'lu ol!",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    color: AppColors.primaryPurple,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        height: 100,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -10,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: const BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.workspace_premium,
                                  color: AppColors.primaryPurple,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 75,
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.fastfood,
                                color: Colors.orange,
                                size: 45,
                              ),
                            ),
                            Positioned(
                              bottom: -10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Text(
                                  "Ücretsiz Teslimat",
                                  style: TextStyle(
                                    color: AppColors.primaryPurple,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            if (addressOpacity > 0)
              Positioned(
                top: addressTop,
                left: 16,
                right: 16,
                child: Opacity(
                  opacity: addressOpacity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.white,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Beyoğlu 1923. Sokak 1881',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Istanbul Beyoğlu 34421',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: AppColors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),

            Positioned(
              top: searchTop,
              left: 16,
              right: 16,
              child: Container(
                height: _barHeight,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(Icons.search, color: AppColors.textDark),
                    SizedBox(width: 12),
                    Text(
                      'Restoran veya işletme arayın',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: _ovalH,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}