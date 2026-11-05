import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'parking_details_screen.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _showMap = false;

  final List<Map<String, dynamic>> _parkingLocations = [
    {
      'name': 'Old City Parking A',
      'distance': '350 m from Umayyad Mosque',
      'price': 'SYP 2,000 / hour (sample)',
      'status': 'Available',
      'available': true,
    },
    {
      'name': 'Citadel Parking B',
      'distance': '600 m from Citadel',
      'price': 'SYP 1,500 / hour (sample)',
      'status': 'Limited',
      'available': false,
    },
  ];

  List<Map<String, dynamic>> get _filteredLocations {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return _parkingLocations;
    }

    return _parkingLocations.where((location) {
      return location['name'].toString().toLowerCase().contains(query) ||
          location['distance'].toString().toLowerCase().contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 28),
                    _buildSearchField(),
                    const SizedBox(height: 24),
                    _buildViewSelector(),
                    const SizedBox(height: 28),
                    Text(
                      'Near: Damascus Old City',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_showMap)
                      _buildIllustrativeMap()
                    else
                      _buildParkingList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find Parking',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryGreen,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 32,
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.gold,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: 'Search parking near attractions...',
        hintStyle: TextStyle(
          color: AppTheme.textMuted,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppTheme.textMuted,
          size: 27,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFFE8E6DE),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: AppTheme.primaryGreen,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildViewSelector() {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEAE3D2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildSelectorButton('List', false),
          _buildSelectorButton('Map', true),
        ],
      ),
    );
  }

  Widget _buildSelectorButton(String label, bool isMap) {
    final selected = _showMap == isMap;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showMap = isMap;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selected ? AppTheme.primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : AppTheme.textMuted,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildParkingList() {
    final locations = _filteredLocations;

    if (locations.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text(
            'No parking locations found.',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 15,
            ),
          ),
        ),
      );
    }

    return Column(
      children: locations.map((location) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _buildParkingCard(location),
        );
      }).toList(),
    );
  }

  Widget _buildParkingCard(Map<String, dynamic> location) {
    final bool available = location['available'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE8E6DE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location['name'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            location['distance'],
            style: TextStyle(
              fontSize: 15,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            location['price'],
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.primaryGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: available
                      ? const Color(0xFFDDE6E2)
                      : const Color(0xFFF7F2E9),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  location['status'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: available
                        ? AppTheme.primaryGreen
                        : const Color(0xFF96702F),
                  ),
                ),
              ),
              ElevatedButton(
               onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ParkingDetailsScreen(
        location: location,
      ),
    ),
  );
},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'View details',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIllustrativeMap() {
    return Container(
      height: 230,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFE8E1D0),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 120,
            top: -20,
            bottom: -20,
            child: Container(
              width: 8,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: -20,
            right: -20,
            top: 95,
            child: Container(
              height: 8,
              color: Colors.white,
            ),
          ),
          Positioned(
            right: 130,
            top: 0,
            bottom: -10,
            child: Transform.rotate(
              angle: -0.4,
              child: Container(
                width: 10,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 115,
            top: 88,
            child: _buildMapMarker(AppTheme.primaryGreen),
          ),
          Positioned(
            right: 105,
            top: 50,
            child: _buildMapMarker(AppTheme.gold),
          ),
          Positioned(
            left: 16,
            bottom: 14,
            child: Text(
              'Illustrative map, not live data',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textMuted,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapMarker(Color color) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}