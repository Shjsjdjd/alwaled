import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class AreaDetailsScreen extends StatelessWidget {
  const AreaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: AppTheme.ivory,
            foregroundColor: AppTheme.textDark,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Damascus',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/damascus-courtyard-ai-concept.png',
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.65),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Discover Damascus',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Explore one of the world’s oldest continuously '
                    'inhabited cities, known for its historic markets, '
                    'traditional architecture, and rich cultural heritage.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: AppTheme.textMuted,
                    ),
                  ),
                  const SizedBox(height: 28),
                  _buildSectionTitle('Top Attractions'),
                  const SizedBox(height: 14),
                  _buildPlaceCard(
                    icon: Icons.mosque_outlined,
                    name: 'Umayyad Mosque',
                    subtitle: 'Historic mosque in the Old City',
                    rating: '4.9',
                  ),
                  _buildPlaceCard(
                    icon: Icons.account_balance_outlined,
                    name: 'Azm Palace',
                    subtitle: 'Traditional Damascene architecture',
                    rating: '4.7',
                  ),
                  _buildPlaceCard(
                    icon: Icons.storefront_outlined,
                    name: 'Al-Hamidiyya Souq',
                    subtitle: 'Famous traditional covered market',
                    rating: '4.8',
                  ),
                  const SizedBox(height: 28),
                  _buildSectionTitle('Recommended Hotels'),
                  const SizedBox(height: 14),
                  _buildPlaceCard(
                    icon: Icons.hotel_outlined,
                    name: 'Beit Zaman Hotel',
                    subtitle: 'Traditional boutique hotel',
                    rating: '4.6',
                  ),
                  _buildPlaceCard(
                    icon: Icons.hotel_outlined,
                    name: 'Damascus Rose Hotel',
                    subtitle: 'Comfortable city accommodation',
                    rating: '4.5',
                  ),
                  _buildPlaceCard(
                    icon: Icons.hotel_outlined,
                    name: 'Old City Hotel',
                    subtitle: 'Stay near historical landmarks',
                    rating: '4.4',
                  ),
                  const SizedBox(height: 28),
                  _buildSectionTitle('Recommended Restaurants'),
                  const SizedBox(height: 14),
                  _buildPlaceCard(
                    icon: Icons.restaurant_outlined,
                    name: 'Naranj Restaurant',
                    subtitle: 'Traditional Syrian cuisine',
                    rating: '4.7',
                  ),
                  _buildPlaceCard(
                    icon: Icons.restaurant_outlined,
                    name: 'Beit Jabri',
                    subtitle: 'Damascene dining experience',
                    rating: '4.8',
                  ),
                  _buildPlaceCard(
                    icon: Icons.restaurant_outlined,
                    name: 'Al Khawali',
                    subtitle: 'Restaurant in the Old City',
                    rating: '4.6',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: AppTheme.textDark,
      ),
    );
  }

  Widget _buildPlaceCard({
    required IconData icon,
    required String name,
    required String subtitle,
    required String rating,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: AppTheme.ivory,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 28,
              color: AppTheme.primaryGreen,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 16,
                color: AppTheme.gold,
              ),
              const SizedBox(width: 3),
              Text(
                rating,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}