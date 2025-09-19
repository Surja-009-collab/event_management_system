import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy booking data
    final bookings = [
      {
        'venue': 'Grand Palace Hall',
        'date': '2025-10-12',
        'image': 'assets/images/venue1.jpeg',
        'status': 'Confirmed',
      },
      {
        'venue': 'Sunset Banquet',
        'date': '2025-11-05',
        'image': 'assets/images/venue2.jpeg',
        'status': 'Pending',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  booking['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                booking['venue']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Date: ${booking['date']}\nStatus: ${booking['status']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
