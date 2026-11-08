import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class BookingStorage {
  static const String _storageKey = 'parking_bookings';

  static Future<void> saveBooking(
    Map<String, dynamic> booking,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final bookings = await getBookings();

    bookings.add(booking);

    await prefs.setString(_storageKey, jsonEncode(bookings));
  }

  static Future<List<Map<String, dynamic>>> getBookings() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getString(_storageKey);

    if (storedData == null) return [];

    final decodedData = jsonDecode(storedData) as List;

    return decodedData
        .map((booking) => Map<String, dynamic>.from(booking))
        .toList();
  }

  static Future<void> updateBooking(
    String bookingReference,
    Map<String, dynamic> updates,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final bookings = await getBookings();

    final index = bookings.indexWhere(
      (booking) =>
          booking['bookingReference'] == bookingReference,
    );

    if (index == -1) {
      throw Exception('Booking not found.');
    }

    bookings[index] = {
      ...bookings[index],
      ...updates,
    };

    await prefs.setString(_storageKey, jsonEncode(bookings));
  }
}