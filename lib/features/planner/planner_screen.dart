import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';

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

  String areaLabel(AppLocalizations l10n, String value) {
    switch (value) {
      case 'Damascus':
        return l10n.areaDamascus;
      case 'Palmyra':
        return l10n.areaPalmyra;
      case 'Aleppo':
        return l10n.areaAleppo;
      case 'Latakia':
        return l10n.areaLatakia;
      case 'Homs':
        return l10n.areaHoms;
      case 'Hama':
        return l10n.areaHama;
      case 'Bosra':
        return l10n.areaBosra;
      case 'Crac des Chevaliers':
        return l10n.areaCrac;
      default:
        return value;
    }
  }

  String durationLabel(AppLocalizations l10n, String value) {
    switch (value) {
      case '1 day':
        return l10n.durationOneDay;
      case '2–3 days':
        return l10n.durationTwoThreeDays;
      case '4–5 days':
        return l10n.durationFourFiveDays;
      case '1 week':
        return l10n.durationOneWeek;
      default:
        return value;
    }
  }

  String budgetLabel(AppLocalizations l10n, String value) {
    switch (value) {
      case 'Budget':
        return l10n.budgetOption;
      case 'Moderate':
        return l10n.moderateOption;
      case 'Luxury':
        return l10n.luxuryOption;
      default:
        return value;
    }
  }

  String interestLabel(AppLocalizations l10n, String value) {
    switch (value) {
      case 'History':
        return l10n.interestHistory;
      case 'Architecture':
        return l10n.interestArchitecture;
      case 'Nature':
        return l10n.interestNature;
      case 'Food':
        return l10n.interestFood;
      case 'Culture':
        return l10n.interestCulture;
      case 'Adventure':
        return l10n.interestAdventure;
      default:
        return value;
    }
  }

  void generateTrip() {
    final l10n = AppLocalizations.of(context)!;

    if (selectedArea == null ||
        selectedDuration == null ||
        selectedBudget == null ||
        selectedInterests.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.completeSelections),
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
    final l10n = AppLocalizations.of(context)!;

    final areas = [
      'Damascus',
      'Palmyra',
      'Aleppo',
      'Latakia',
      'Homs',
      'Hama',
      'Bosra',
      'Crac des Chevaliers',
    ];

    final durations = [
      '1 day',
      '2–3 days',
      '4–5 days',
      '1 week',
    ];

    final budgets = [
      'Budget',
      'Moderate',
      'Luxury',
    ];

    final interests = [
      'History',
      'Architecture',
      'Nature',
      'Food',
      'Culture',
      'Adventure',
    ];

    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        backgroundColor: AppTheme.ivory,
        elevation: 0,
        title: Text(
          l10n.plannerTitle,
          style: const TextStyle(
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
            // INTRODUCTION CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: AppTheme.gold,
                    size: 32,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    l10n.plannerHeroTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.plannerHeroDescription,
                    style: const TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            _sectionTitle(l10n.whereToGo),
            const SizedBox(height: 12),

            _dropdown(
              value: selectedArea,
              hint: l10n.chooseDestination,
              items: areas.map((area) {
                return DropdownMenuItem<String>(
                  value: area,
                  child: Text(areaLabel(l10n, area)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedArea = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle(l10n.tripDuration),
            const SizedBox(height: 12),

            _choiceGrid(
              options: durations.map((duration) {
                return MapEntry(
                  duration,
                  durationLabel(l10n, duration),
                );
              }).toList(),
              selected: selectedDuration,
              onSelected: (value) {
                setState(() => selectedDuration = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle(l10n.tripBudget),
            const SizedBox(height: 12),

            _choiceGrid(
              options: budgets.map((budget) {
                return MapEntry(
                  budget,
                  budgetLabel(l10n, budget),
                );
              }).toList(),
              selected: selectedBudget,
              onSelected: (value) {
                setState(() => selectedBudget = value);
              },
            ),

            const SizedBox(height: 24),

            _sectionTitle(l10n.tripInterests),
            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: interests.map((interest) {
                final isSelected =
                    selectedInterests.contains(interest);

                return FilterChip(
                  label: Text(interestLabel(l10n, interest)),
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
                  selectedColor:
                      AppTheme.primaryGreen.withValues(alpha: 0.15),
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
                label: Text(
                  l10n.generateTrip,
                  style: const TextStyle(
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
    required List<DropdownMenuItem<String>> items,
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
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _choiceGrid({
    required List<MapEntry<String, String>> options,
    required String? selected,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: options.map((option) {
        final isSelected = selected == option.key;

        return ChoiceChip(
          label: Text(option.value),
          selected: isSelected,
          onSelected: (_) => onSelected(option.key),
          selectedColor: AppTheme.primaryGreen,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textDark,
            fontWeight: FontWeight.w600,
          ),
          side: BorderSide(
            color: isSelected
                ? AppTheme.primaryGreen
                : Colors.grey.shade300,
          ),
        );
      }).toList(),
    );
  }
}

// TRIP RESULT SCREEN

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

  String areaLabel(AppLocalizations l10n) {
    switch (area) {
      case 'Damascus':
        return l10n.areaDamascus;
      case 'Palmyra':
        return l10n.areaPalmyra;
      case 'Aleppo':
        return l10n.areaAleppo;
      case 'Latakia':
        return l10n.areaLatakia;
      case 'Homs':
        return l10n.areaHoms;
      case 'Hama':
        return l10n.areaHama;
      case 'Bosra':
        return l10n.areaBosra;
      case 'Crac des Chevaliers':
        return l10n.areaCrac;
      default:
        return area;
    }
  }

  String durationLabel(AppLocalizations l10n) {
    switch (duration) {
      case '1 day':
        return l10n.durationOneDay;
      case '2–3 days':
        return l10n.durationTwoThreeDays;
      case '4–5 days':
        return l10n.durationFourFiveDays;
      case '1 week':
        return l10n.durationOneWeek;
      default:
        return duration;
    }
  }

  String budgetLabel(AppLocalizations l10n) {
    switch (budget) {
      case 'Budget':
        return l10n.budgetOption;
      case 'Moderate':
        return l10n.moderateOption;
      case 'Luxury':
        return l10n.luxuryOption;
      default:
        return budget;
    }
  }

  String interestLabel(AppLocalizations l10n, String interest) {
    switch (interest) {
      case 'History':
        return l10n.interestHistory;
      case 'Architecture':
        return l10n.interestArchitecture;
      case 'Nature':
        return l10n.interestNature;
      case 'Food':
        return l10n.interestFood;
      case 'Culture':
        return l10n.interestCulture;
      case 'Adventure':
        return l10n.interestAdventure;
      default:
        return interest;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localizedArea = areaLabel(l10n);

    final localizedInterests = interests
        .map((interest) => interestLabel(l10n, interest))
        .join(
          Localizations.localeOf(context).languageCode == 'ar'
              ? '، '
              : ', ',
        );

    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        title: Text(l10n.yourTripPlan),
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
              l10n.yourAdventure(localizedArea),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryGreen,
              ),
            ),

            const SizedBox(height: 20),

            _resultCard(
              l10n.destinationLabel,
              localizedArea,
            ),

            _resultCard(
              l10n.durationLabel,
              durationLabel(l10n),
            ),

            _resultCard(
              l10n.budgetLabel,
              budgetLabel(l10n),
            ),

            _resultCard(
              l10n.interestsLabel,
              localizedInterests,
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.sampleItinerary,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGreen,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    l10n.itineraryPlaceholder,
                    style: const TextStyle(
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