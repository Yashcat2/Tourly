import 'package:flutter/material.dart';

class BookingListPage extends StatelessWidget {
  final String userEmail;

  BookingListPage({required this.userEmail});

  final Map<String, List<Map<String, dynamic>>> bookings = {
    "user1@example.com": [
      {
        "checkIn": "2024-12-10",
        "checkOut": "2024-12-15",
        "adults": 2,
        "children": 1,
      },
    ],
    "user2@example.com": [
      {
        "checkIn": "2024-12-20",
        "checkOut": "2024-12-25",
        "adults": 1,
        "children": 0,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final userBookings = bookings[userEmail] ?? [];
    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: ListView.builder(
        itemCount: userBookings.length,
        itemBuilder: (context, index) {
          final booking = userBookings[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                  "Check-in: ${booking['checkIn']} - Check-out: ${booking['checkOut']}"),
              subtitle: Text(
                  "Adults: ${booking['adults']}, Children: ${booking['children']}"),
            ),
          );
        },
      ),
    );
  }
}
