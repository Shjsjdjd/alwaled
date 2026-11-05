
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  String? selectedArea;
  String? selectedDuration;
  String? selectedBudget;

  final Set<String> selectedInterests = {};

  final List<String> areas = [
    'Damascus',
    'Palmyra',
    'Aleppo',
    'Latakia',
    'Homs',
    'Hama',
    'Bosra',
    'Crac des Chevaliers',
  ];

  final List<String> durations = [
    '1 day',
    '2–3 days',
    '4–5 days',
    '1 week',
  ];

  final List<String> budgets = [
    'Budget',
    'Moderate',
    'Luxury',
  ];

  final List<String> interests = [
    'History',
    'Architecture',
    'Nature',
    'Food',
    'Culture',
    'Adventure',
  ];

  void generateTrip() {
    if (selectedArea == null ||
        selectedDuration == null ||
        selectedBudget == null ||
        selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all selections first.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TripResultScreen(
          area: selectedArea!,
          duration: selectedDuration!,
          budget: selectedBudget!,
          interests: selectedInterests.toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        backgroundColor: AppTheme.ivory,
        elevation: 0,
        title: const Text(
          'AI TRIP PLANNER',
          style: TextStyle(
            color: AppTheme.primaryGreen,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: AppTheme.gold,
                    size: 32,
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Your Syrian journey starts here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tell us what you enjoy and your budget. '
                    'We will help organize your trip.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            _sectionTitle('Where do you want to go?'),
            const SizedBox(height: 12),

            _dropdown(
              value: selectedArea,
              hint: 'Choose a destination area',
              items: areas,
              onChanged: (value) {
                setState(() => selectedArea = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle('How long is your trip?'),
            const SizedBox(height: 12),

            _choiceGrid(
              options: durations,
              selected: selectedDuration,
              onSelected: (value) {
                setState(() => selectedDuration = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle('What is your budget?'),
            const SizedBox(height: 12),

            _choiceGrid(
              options: budgets,
              selected: selectedBudget,
              onSelected: (value) {
                setState(() => selectedBudget = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle('What are you interested in?'),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: interests.map((interest) {
                final isSelected = selectedInterests.contains(interest);

                return FilterChip(
                  label: Text(interest),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedInterests.add(interest);
                      } else {
                        selectedInterests.remove(interest);
                      }
                    });
                  },
                  selectedColor: AppTheme.primaryGreen.withValues(alpha: 0.15),
                  checkmarkColor: AppTheme.primaryGreen,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? AppTheme.primaryGreen
                        : AppTheme.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                  side: BorderSide(
                    color: isSelected
                        ? AppTheme.primaryGreen
                        : Colors.grey.shade300,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: generateTrip,
                icon: const Icon(Icons.auto_awesome),
                label: const Text(
                  'Generate My Trip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: AppTheme.textDark,
      ),
    );
  }

  Widget _dropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint),
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _choiceGrid({
    required List<String> options,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        final isSelected = selected == option;

        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (_) => onSelected(option),
          selectedColor: AppTheme.primaryGreen,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white :AppTheme.textDark,
            fontWeight: FontWeight.w600,
          ),
          side: BorderSide(
            color: isSelected
                ?AppTheme.primaryGreen
                : Colors.grey.shade300,
          ),
        );
      }).toList(),
    );
  }
}

class TripResultScreen extends StatelessWidget {
  final String area;
  final String duration;
  final String budget;
  final List<String> interests;

  const TripResultScreen({
    super.key,
    required this.area,
    required this.duration,
    required this.budget,
    required this.interests,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        title: const Text('YOUR TRIP PLAN'),
        backgroundColor: AppTheme.ivory,
        foregroundColor: AppTheme.primaryGreen,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.auto_awesome,
              color: AppTheme.gold,
              size: 38,
            ),
            const SizedBox(height: 12),
            Text(
              'Your $area adventure',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryGreen,
              ),
            ),
            const SizedBox(height: 20),
            _resultCard('Destination', area),
            _resultCard('Duration', duration),
            _resultCard('Budget', budget),
            _resultCard('Interests', interests.join(', ')),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sample itinerary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Your personalized itinerary will appear here '
                    'once the AI planning service is connected.',
                    style: TextStyle(
                      color: AppTheme.textDark,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultCard(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textDark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

