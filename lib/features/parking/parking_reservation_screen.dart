import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ParkingReservationScreen extends StatelessWidget {
  final Map<String, dynamic> location;
  final DateTime selectedDate;
  final String selectedTime;

  const ParkingReservationScreen({
    super.key,
    required this.location,
    required this.selectedDate,
    required this.selectedTime,
  });

  String get formattedDate {
    return '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        backgroundColor: AppTheme.ivory,
        foregroundColor: AppTheme.primaryGreen,
        elevation: 0,
        title: const Text(
          'Reservation Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review Your Booking',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryGreen,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Check your parking reservation details before proceeding.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.textMuted,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.local_parking,
                      size: 40,
                      color: AppTheme.primaryGreen,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      location['name'],
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      location['distance'],
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Divider(),

                    const SizedBox(height: 15),

                    _detailRow(
                      Icons.calendar_month_outlined,
                      'Date',
                      formattedDate,
                    ),

                    const SizedBox(height: 18),

                    _detailRow(
                      Icons.access_time,
                      'Time',
                      selectedTime,
                    ),

                    const SizedBox(height: 18),

                    _detailRow(
                      Icons.location_on_outlined,
                      'Location',
                      location['name'],
                    ),

                    const SizedBox(height: 18),

                    _detailRow(
                      Icons.payments_outlined,
                      'Price',
                      location['price'],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE3D2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppTheme.primaryGreen,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Your booking is not confirmed yet. Continue to the payment step to complete the reservation.',
                        style: TextStyle(
                          color: AppTheme.textDark,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Payment screen is coming next.',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Continue to Payment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryGreen,
          size: 21,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppTheme.textDark,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}