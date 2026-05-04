import 'package:flutter/material.dart';

class AramaLayout extends StatefulWidget {
  const AramaLayout({super.key});

  @override
  State<AramaLayout> createState() => _AramaLayoutState();
}

class _AramaLayoutState extends State<AramaLayout> {
  // Arama geçmişini burada bir listede tutuyoruz
  List<String> _recentSearches = [
    'sütlaç',
    'künefe',
    'tatlı',
    'akdeniz döner',
    'kral pizza',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildStickySearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildPopularCuisines(),
                    const SizedBox(height: 24),
                    // Eğer liste boşsa başlığı göstermemek daha şık olur
                    if (_recentSearches.isNotEmpty) _buildRecentSearches(),
                    const SizedBox(height: 24),
                    _buildFeaturedSection(),
                    const SizedBox(height: 24),
                    _buildPopularRestaurantSearches(),
                    const SizedBox(height: 24),
                    _buildPopularStoreSearches(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStickySearchBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey.shade600, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Restoran veya işletme arayın',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularCuisines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Popüler mutfaklar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildCuisineItem('Döner', 'https://plus.unsplash.com/premium_photo-1731512475641-191f7841512e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              const SizedBox(width: 12),
              _buildCuisineItem('Kebap &\nTürk Mutfağı', 'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?w=150&h=150&fit=crop'),
              const SizedBox(width: 12),
              _buildCuisineItem('Burger', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=150&h=150&fit=crop'),
              const SizedBox(width: 12),
              _buildCuisineItem('Pizza', 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=150&h=150&fit=crop'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCuisineItem(String title, String imageUrl) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'En Son Aramalar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Listeyi dinamik olarak oluşturuyoruz
        ..._recentSearches.map((search) => _buildRecentSearchItem(search)).toList(),
      ],
    );
  }

  Widget _buildRecentSearchItem(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(Icons.history, color: Colors.grey.shade600, size: 22),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.grey.shade600, size: 20),
              onPressed: () {
                setState(() {
                  _recentSearches.remove(text);
                });
              },
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Uygulama tarafından öne çıkartılan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Sponsorlu',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildFeaturedCard(
                'Merkez Pilavcısı',
                'Minimum 20 TL',
                'https://images.unsplash.com/photo-1536304993881-ff6e9eefa2a6?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
              const SizedBox(width: 12),
              _buildFeaturedCard(
                'Usta Döner',
                'Minimum 50 TL',
                'https://images.unsplash.com/photo-1529144415895-6aaf8be872fb?w=200&h=200&fit=crop',
              ),
              const SizedBox(width: 12),
              _buildFeaturedCard(
                'Mangal Keyfi',
                'Minimum 100 TL',
                'https://images.unsplash.com/photo-1567620832903-9fc6debc209f?w=200&h=200&fit=crop',
              ),
              const SizedBox(width: 12),
              _buildFeaturedCard(
                'Acılı Çiğ Köfte',
                'Minimum 30 TL',
                'https://images.unsplash.com/photo-1516594798947-e65505dbb29d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCard(String title, String subtitle, String imageUrl) {
    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularRestaurantSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popüler restoran aramaları',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 12.0,
            children: [
              _buildSearchChip('pizza'),
              _buildSearchChip('burger'),
              _buildSearchChip('döner'),
              _buildSearchChip('tavuk'),
              _buildSearchChip('lahmacun'),
              _buildSearchChip('kebap'),
              _buildSearchChip('pide'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularStoreSearches() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popüler mağaza aramaları',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 12.0,
            children: [
              _buildSearchChip('pizza'),
              _buildSearchChip('süt'),
              _buildSearchChip('burger'),
              _buildSearchChip('su'),
              _buildSearchChip('cips'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}