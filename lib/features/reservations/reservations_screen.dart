import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel Reservation?'),
        content: const Text(
          'Are you sure you want to cancel this parking reservation? '
          'This demonstration will simulate a successful refund.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Keep Reservation'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Confirm Cancellation'),
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
        const SnackBar(
          content: Text(
            'Reservation cancelled. Demo refund processed.',
          ),
          backgroundColor: AppTheme.primaryGreen,
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cancellation failed: $error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ivory,
      appBar: AppBar(
        title: const Text('My Reservations'),
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
            return const Center(
              child: Text('Unable to load reservations.'),
            );
          }

          final bookings = snapshot.data ?? [];

          if (bookings.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refreshBookings,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 180),
                  Icon(
                    Icons.event_busy,
                    size: 64,
                    color: AppTheme.textMuted,
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      'No Reservations Yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Your parking reservations will appear here.',
                      style: TextStyle(color: AppTheme.textMuted),
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
                                    'Parking Location',
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
                          'Booking Reference',
                          booking['bookingReference']?.toString() ?? '-',
                        ),
                        _detailRow(
                          'Date',
                          _formatDate(
                            booking['date']?.toString() ?? '',
                          ),
                        ),
                        _detailRow(
                          'Time',
                          booking['time']?.toString() ?? '-',
                        ),
                        _detailRow(
                          'Payment',
                          booking['paymentMethod']?.toString() ?? '-',
                        ),
                        _detailRow('Status', status),
                        if (cancelled)
                          _detailRow(
                            'Refund',
                            booking['refundStatus']?.toString() ??
                                'Not available',
                          ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                              label: const Text('Cancel Reservation'),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                              'This reservation has been cancelled.',
                              style: TextStyle(
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

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppTheme.textMuted),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}