import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/theme/app_theme.dart';

class ParkingConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic> location;
  final DateTime selectedDate;
  final String selectedTime;
  final String bookingReference;

  const ParkingConfirmationScreen({
    super.key,
    required this.location,
    required this.selectedDate,
    required this.selectedTime,
    required this.bookingReference,
  });

  @override
  Widget build(BuildContext context) {
    final locationName =
        location['name']?.toString() ?? 'Parking Location';

    final price =
        location['price']?.toString() ?? 'Price unavailable';

    final formattedDate =
        '${selectedDate.day.toString().padLeft(2, '0')}/'
        '${selectedDate.month.toString().padLeft(2, '0')}/'
        '${selectedDate.year}';

    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        backgroundColor: AppTheme.ivory,
        foregroundColor: AppTheme.textDark,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 16),

            const Icon(
              Icons.check_circle,
              color: AppTheme.primaryGreen,
              size: 72,
            ),

            const SizedBox(height: 16),

            const Text(
              'Booking Confirmed!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryGreen,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Your parking reservation was completed successfully.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textMuted,
              ),
            ),

            const SizedBox(height: 28),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.border),
              ),
              child: Column(
                children: [
                  const Text(
                    'Your Parking QR Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),

                  const SizedBox(height: 20),

                  QrImageView(
                    data: bookingReference,
                    version: QrVersions.auto,
                    size: 190,
                    backgroundColor: Colors.white,
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Show this QR code when you arrive.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 12),

                  _buildDetail(
                    'Booking Reference',
                    bookingReference,
                  ),

                  _buildDetail(
                    'Parking Location',
                    locationName,
                  ),

                  _buildDetail(
                    'Date',
                    formattedDate,
                  ),

                  _buildDetail(
                    'Time',
                    selectedTime,
                  ),

                  _buildDetail(
                    'Price',
                    price,
                  ),

                  _buildDetail(
                    'Payment Method',
                    'Credit / Debit Card',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

  Widget _buildDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: AppTheme.textDark,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}