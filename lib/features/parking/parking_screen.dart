
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import 'parking_details_screen.dart';

class ParkingScreen extends StatefulWidget {
  const ParkingScreen({super.key});

  @override
  State<ParkingScreen> createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _showMap = false;

  List<Map<String, dynamic>> _getParkingLocations(
      AppLocalizations l10n) {
    return [
      {
        'name': l10n.oldCityParking,
        'distance': l10n.distanceUmayyad,
        'price': l10n.parkingPriceOldCity,
        'status': l10n.available,
        'available': true,
      },
      {
        'name': l10n.citadelParking,
        'distance': l10n.distanceCitadel,
        'price': l10n.parkingPriceCitadel,
        'status': l10n.limitedAvailability,
        'available': false,
      },
    ];
  }

  List<Map<String, dynamic>> _filteredLocations(
      AppLocalizations l10n) {
    final locations = _getParkingLocations(l10n);
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return locations;
    }

    return locations.where((location) {
      return location['name']
              .toString()
              .toLowerCase()
              .contains(query) ||
          location['distance']
              .toString()
              .toLowerCase()
              .contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                    _buildHeader(l10n),
                    const SizedBox(height: 28),
                    _buildSearchField(l10n),
                    const SizedBox(height: 24),
                    _buildViewSelector(l10n),
                    const SizedBox(height: 28),
                    Text(
                      l10n.parkingNearDamascus,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppTheme.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (_showMap)
                      _buildIllustrativeMap(l10n)
                    else
                      _buildParkingList(l10n),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.findParking,
          style: const TextStyle(
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

  Widget _buildSearchField(AppLocalizations l10n) {
    return TextField(
      controller: _searchController,
      onChanged: (_) => setState(() {}),
      decoration: InputDecoration(
        hintText: l10n.searchParking,
        hintStyle: const TextStyle(
          color: AppTheme.textMuted,
          fontSize: 15,
        ),
        prefixIcon: const Icon(
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
          borderSide: const BorderSide(
            color: AppTheme.primaryGreen,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _buildViewSelector(AppLocalizations l10n) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEAE3D2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildSelectorButton(l10n.listView, false),
          _buildSelectorButton(l10n.mapView, true),
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
            color: selected
                ? AppTheme.primaryGreen
                : Colors.transparent,
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

  Widget _buildParkingList(AppLocalizations l10n) {
    final locations = _filteredLocations(l10n);

    if (locations.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Text(
            l10n.noParkingFound,
            style: const TextStyle(
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            location['distance'],
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textMuted,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            location['price'],
            style: const TextStyle(
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
                child: Text(
                  AppLocalizations.of(context)!.viewDetails,
                  style: const TextStyle(
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

  Widget _buildIllustrativeMap(AppLocalizations l10n) {
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
          PositionedDirectional(
            start: 16,
            bottom: 14,
            child: Text(
              l10n.illustrativeMapNotice,
              style: const TextStyle(
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
