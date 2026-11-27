import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/app_localizations.dart';
import 'booking_storage.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  Future<List<Map<String, dynamic>>>? _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    _bookingsFuture = BookingStorage.getBookings();
  }

  Future<void> _refreshBookings() async {
    setState(_loadBookings);
    await _bookingsFuture;
  }

  String _formatDate(String date) {
    final parsedDate = DateTime.tryParse(date);

    if (parsedDate == null) return date;

    return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year}';
  }

  bool _canCancel(Map<String, dynamic> booking) {
    if (booking['status'] != 'Confirmed') return false;

    final date = DateTime.tryParse(
      booking['date']?.toString() ?? '',
    );

    if (date == null) return false;

    final now = DateTime.now();

    return date.isAfter(
      DateTime(now.year, now.month, now.day),
    );
  }

  Future<void> _cancelBooking(
    Map<String, dynamic> booking,
  ) async {
    final l10n = AppLocalizations.of(context)!;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.cancelReservationTitle),
        content: Text(l10n.cancelReservationMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.keepReservation),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.confirmCancellation),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await BookingStorage.updateBooking(
        booking['bookingReference'].toString(),
        {
          'status': 'Cancelled',
          'refundStatus': 'Refund Processed (Demo)',
          'cancelledAt': DateTime.now().toIso8601String(),
        },
      );

      if (!mounted) return;

      await _refreshBookings();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.cancellationSuccess),
          backgroundColor: AppTheme.primaryGreen,
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
content: Text(l10n.cancellationFailed),        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        title: Text(l10n.myReservations),
        backgroundColor: AppTheme.ivory,
        actions: [
          IconButton(
            onPressed: _refreshBookings,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _bookingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(l10n.unableToLoadReservations),
            );
          }

          final bookings = snapshot.data ?? [];

          if (bookings.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refreshBookings,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 180),
                  const Icon(
                    Icons.event_busy,
                    size: 64,
                    color: AppTheme.textMuted,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      l10n.noReservationsYet,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        l10n.reservationsWillAppearHere,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshBookings,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking =
                    bookings[bookings.length - 1 - index];

                final status =
                    booking['status']?.toString() ?? 'Confirmed';

                final cancelled = status == 'Cancelled';

                final displayStatus = cancelled
                    ? l10n.cancelledStatus
                    : l10n.confirmedStatus;

                final paymentMethod =
                    booking['paymentMethod']?.toString() ?? '-';

                final displayPaymentMethod =
                    paymentMethod == 'Credit / Debit Card'
                        ? l10n.creditDebitCard
                        : paymentMethod;

                return Card(
                  color: AppTheme.white,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.local_parking,
                              color: AppTheme.primaryGreen,
                              size: 28,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                booking['location']?.toString() ??
                                    l10n.parkingLocation,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textDark,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 24),

                        _detailRow(
                          l10n.bookingReference,
                          booking['bookingReference']?.toString() ?? '-',
                        ),

                        _detailRow(
                          l10n.dateLabel,
                          _formatDate(
                            booking['date']?.toString() ?? '',
                          ),
                        ),

                        _detailRow(
                          l10n.timeLabel,
                          booking['time']?.toString() ?? '-',
                        ),

                        _detailRow(
                          l10n.paymentMethod,
                          displayPaymentMethod,
                        ),

                        _detailRow(
                          l10n.statusLabel,
                          displayStatus,
                          valueColor: cancelled
                              ? Colors.red
                              : AppTheme.primaryGreen,
                        ),

                        if (cancelled)
                          _detailRow(
                            l10n.refundLabel,
                            l10n.demoRefundProcessed,
                          ),

                        const Divider(height: 24),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.totalLabel,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppTheme.textDark,
                              ),
                            ),
                            Text(
                              booking['price']?.toString() ?? '-',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppTheme.primaryGreen,
                              ),
                            ),
                          ],
                        ),

                        if (_canCancel(booking)) ...[
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () => _cancelBooking(booking),
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.red,
                              ),
                              label: Text(l10n.cancelReservation),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(
                                  color: Colors.red,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],

                        if (cancelled)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              l10n.reservationCancelledNotice,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _detailRow(
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: AppTheme.textMuted,
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: valueColor ?? AppTheme.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}