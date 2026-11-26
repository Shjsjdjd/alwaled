import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../l10n/app_localizations.dart';

const Color _primaryGreen = Color(0xFF245548);
const Color _background = Color(0xFFF8F4EB);
const Color _textDark = Color(0xFF242820);
const Color _textGray = Color(0xFF77766E);

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
    final l10n = AppLocalizations.of(context)!;

    final locationName =
        location['name']?.toString() ?? l10n.priceUnavailable;

    final price = location['price']?.toString() ?? '';

    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        title: Text(l10n.bookingConfirmation),
        backgroundColor: _primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: _primaryGreen.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: _primaryGreen,
                  size: 52,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                l10n.bookingConfirmed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _textDark,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                l10n.bookingSuccessMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _textGray,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _primaryGreen.withValues(alpha: 0.15),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      l10n.parkingQrCode,
                      style: const TextStyle(
                        color: _textDark,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      l10n.showQrCodeMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _textGray,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 20),

                    QrImageView(
                      data: bookingReference,
                      version: QrVersions.auto,
                      size: 190,
                      backgroundColor: Colors.white,
                    ),

                    const SizedBox(height: 18),

                    Text(
                      l10n.bookingReference,
                      style: const TextStyle(
                        color: _textGray,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 5),

                    SelectableText(
                      bookingReference,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: _primaryGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.bookingSummary,
                      style: const TextStyle(
                        color: _textDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    _buildDetail(
                      l10n.parkingLocation,
                      locationName,
                    ),

                    const Divider(height: 24),

                    _buildDetail(
                      l10n.dateLabel,
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    ),

                    const Divider(height: 24),

                    _buildDetail(
                      l10n.timeLabel,
                      selectedTime,
                    ),

                    const Divider(height: 24),

                    _buildDetail(
                      l10n.priceLabel,
                      price.isEmpty ? l10n.priceUnavailable : price,
                    ),

                    const Divider(height: 24),

                    _buildDetail(
                      l10n.paymentMethod,
                      l10n.creditDebitCard,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    l10n.backToHome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              color: _textGray,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.end,
            softWrap: true,
            style: const TextStyle(
              color: _textDark,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}