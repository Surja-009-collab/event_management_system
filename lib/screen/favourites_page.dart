import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy favourite data
    final favourites = [
      {
        'venue': 'Grand Palace Hall',
        'location': 'Surat, Gujarat',
        'image': 'assets/images/venue1.jpeg',
        'price': '₹ 5,000',
      },
      {
        'venue': 'Sunset Banquet',
        'location': 'Ahmedabad, Gujarat',
        'image': 'assets/images/venue2.jpeg',
        'price': '₹ 7,000',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: favourites.isEmpty
          ? const Center(child: Text('No favourites yet.'))
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) {
                final fav = favourites[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        fav['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      fav['venue']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${fav['location']}\n${fav['price']}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
