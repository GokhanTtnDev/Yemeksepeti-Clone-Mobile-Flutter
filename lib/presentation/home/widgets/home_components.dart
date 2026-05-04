import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.percent, 'title': 'Fırsatlar', 'color': AppColors.primaryRed},
      {'icon': Icons.shopping_basket, 'title': 'Y-Market', 'color': AppColors.primaryRed},
      {'icon': Icons.restaurant_menu, 'title': 'Yeni restoranlar', 'color': AppColors.primaryRed},
      {'icon': Icons.motorcycle, 'title': 'Express', 'color': AppColors.primaryRed},
      {'icon': Icons.local_activity, 'title': 'Kupon', 'color': AppColors.primaryRed},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Icon(categories[index]['icon'] as IconData, color: categories[index]['color'] as Color, size: 30),
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['title'] as String,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FoodCategoryRow extends StatelessWidget {
  const FoodCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.fastfood, 'title': 'Döner'},
      {'icon': Icons.dinner_dining, 'title': 'Kebap &\nTürk Mutfağı'},
      {'icon': Icons.lunch_dining, 'title': 'Burger'},
      {'icon': Icons.local_pizza, 'title': 'Pizza'},
      {'icon': Icons.restaurant_menu, 'title': 'Tavuk'},
    ];

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(categories[index]['icon'] as IconData, color: AppColors.textDark, size: 36),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 76,
                  child: Text(
                    categories[index]['title'] as String,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDark),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.textLight.withOpacity(0.3)),
            ),
            child: const Icon(Icons.chevron_right, size: 20),
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const RestaurantCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.favorite_border, size: 20),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.textDark.withOpacity(0.8), borderRadius: BorderRadius.circular(12)),
                  child: const Text('Öne Çıkan', style: TextStyle(color: AppColors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF6EEFF),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Row(
              children: const [
                Icon(Icons.stars, color: AppColors.primaryPurple, size: 16),
                SizedBox(width: 4),
                Text('PRO', style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(width: 8),
                Text('250TL alışverişe ücretsiz teslimat', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const Row(
                children: [
                  Icon(Icons.star, color: AppColors.primaryRed, size: 16),
                  SizedBox(width: 4),
                  Text('4.0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(' (120000+)', style: TextStyle(color: AppColors.textLight, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text('35-65 dk. • ₺ ₺ • Min. sepet tutarı 150TL • Hamburger', style: TextStyle(color: AppColors.textLight, fontSize: 13)),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.delivery_dining, color: AppColors.green, size: 16),
              SizedBox(width: 4),
              Text('Ücretsiz', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          RestaurantCard(
            title: 'GokhanTtnBurger',
            imagePath: 'assets/burger1.png',
          ),
          RestaurantCard(
            title: 'GTC',
            imagePath: 'assets/tavuklogo.png',
          ),
          RestaurantCard(
            title: 'Gokhan Pizza',
            imagePath: 'assets/gokhanpizza.png',
          ),
        ],
      ),
    );
  }
}

class CampaignBannersList extends StatelessWidget {
  const CampaignBannersList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildPurpleBanner(
            title: 'Gpro İlk ay\nücretsiz!',
            buttonText: 'Hemen keşfet!',
          ),
          const SizedBox(width: 12),
          _buildPurpleBanner(
            title: '₺300 indirim\n+ Ücretsiz Teslimat',
            buttonText: "Gpro'lu ol!",
            hasBurgerKingBadge: true,
            titleColor: const Color(0xFF00FFA3),
          ),
          const SizedBox(width: 12),
          _buildGenericBanner(),
        ],
      ),
    );
  }

  Widget _buildPurpleBanner({required String title, required String buttonText, bool hasBurgerKingBadge = false, Color titleColor = AppColors.white}) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.primaryPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(6)),
                  child: const Text('Y pro', style: TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
                if (hasBurgerKingBadge) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(6)),
                    child: const Text('BURGER\nKING', style: TextStyle(color: AppColors.primaryRed, fontSize: 7, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                ]
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 8,
            right: 8,
            child: Text(
              title,
              style: TextStyle(color: titleColor, fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonText, style: const TextStyle(color: AppColors.primaryPurple, fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_circle_right, color: AppColors.primaryPurple, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenericBanner() {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xFFFFC107),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: AppColors.primaryRed, borderRadius: BorderRadius.circular(8)),
              child: const Text('25 YIL', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
          const Positioned(
            top: 50,
            left: 12,
            child: Text('%50', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 36)),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: AppColors.textDark, borderRadius: BorderRadius.circular(16)),
              child: const Text('Kupon', style: TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountedProductsSection extends StatelessWidget {
  const DiscountedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'restaurant': 'Lezzet Pizza',
        'rating': '3.8',
        'title': '1 Alana 1 Bedava Orta Boy Karışık Pizza',
        'newPrice': '449,90TL',
        'oldPrice': '649,90TL',
        'discount': '30% indirim',
        'time': '20-35 dk.',
      },
      {
        'restaurant': 'Sıcak Döner',
        'rating': '4.1',
        'title': 'Efsane İskender Menü (Bol Tereyağlı)',
        'newPrice': '405,00TL',
        'oldPrice': '475TL',
        'discount': '14% indirim',
        'time': '20-35 dk.',
      },
      {
        'restaurant': 'Lezzet Pizza',
        'rating': '3.8',
        'title': '1 Alana 1 Büyük Boy Sucuklu Pizza',
        'newPrice': '599,90TL',
        'oldPrice': '750,00TL',
        'discount': '25% indirim',
        'time': '20-35 dk.',
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE2F6EB),
            Colors.white,
          ],
          stops: [0.0, 0.4],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00914A),
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                  ),
                  child: const Icon(Icons.percent, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ürünlerde 30%\'ye varan indirim!',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Minimum sepet tutarı vardır.',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2)),
                    ],
                  ),
                  child: const Icon(Icons.chevron_right,
                      size: 24, color: AppColors.textDark),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 330,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Center(
                                  child: Icon(Icons.fastfood,
                                      color: Colors.grey, size: 40)),
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2)),
                                ],
                              ),
                              child: Text(
                                item['time']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textDark),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                            child: const Icon(Icons.restaurant,
                                color: Colors.white, size: 10),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              item['restaurant']!,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black54),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(Icons.star,
                              color: AppColors.primaryRed, size: 14),
                          const SizedBox(width: 2),
                          Text(item['rating']!,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item['newPrice']!,
                            style: const TextStyle(
                                color: Color(0xFF00914A),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item['oldPrice']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['discount']!,
                        style: const TextStyle(
                            color: Color(0xFF00914A),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: const [
                          Icon(Icons.delivery_dining,
                              color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text('Ücretsiz',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PopularBrandsSection extends StatelessWidget {
  const PopularBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {'name': 'Tavukçu Bey', 'time': '20-35 dk.', 'color': const Color(0xFFFFA000), 'icon': Icons.set_meal},
      {'name': 'Köfte Diyarı', 'time': '20-30 dk.', 'color': const Color(0xFFE65100), 'icon': Icons.restaurant},
      {'name': 'Mega Burger', 'time': '5-20 dk.', 'color': const Color(0xFFD32F2F), 'icon': Icons.lunch_dining},
      {'name': 'Efsane Döner', 'time': '20-35 dk.', 'color': const Color(0xFFFBC02D), 'icon': Icons.fastfood},
      {'name': 'Lezzet Durağı', 'time': '15-25 dk.', 'color': const Color(0xFF388E3C), 'icon': Icons.local_pizza},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            'Popüler Markalar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.15), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          brand['icon'] as IconData,
                          color: brand['color'] as Color,
                          size: 42,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 86,
                      child: Text(
                        brand['name'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      brand['time'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}