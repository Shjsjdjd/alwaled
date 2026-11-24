import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../features/parking/parking_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/assistant/assistant_screen.dart';
import '../../features/planner/planner_screen.dart';
import '../../features/reservations/reservations_screen.dart';
import '../../features/profile/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final screens = [
      HomeScreen(onNavigate: _selectTab),
      const AssistantScreen(),
      const PlannerScreen(),
      const ParkingScreen(),
      const ReservationsScreen(),
      const ProfileScreen(),
    ];

    final destinations = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: l10n.home,
      ),
      NavigationDestination(
        icon: const Icon(Icons.auto_awesome_outlined),
        selectedIcon: const Icon(Icons.auto_awesome),
        label: l10n.assistant,
      ),
      NavigationDestination(
        icon: const Icon(Icons.map_outlined),
        selectedIcon: const Icon(Icons.map),
        label: l10n.planner,
      ),
      NavigationDestination(
        icon: const Icon(Icons.local_parking_outlined),
        selectedIcon: const Icon(Icons.local_parking),
        label: l10n.parking,
      ),
      NavigationDestination(
        icon: const Icon(Icons.confirmation_number_outlined),
        selectedIcon: const Icon(Icons.confirmation_number),
        label: l10n.reservations,
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_outline),
        selectedIcon: const Icon(Icons.person),
        label: l10n.profile,
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _selectTab,
        destinations: destinations,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE5EFE9),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 55,
              color: const Color(0xFF245548),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}