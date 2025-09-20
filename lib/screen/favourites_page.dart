import 'package:event_management_system/screen/drawer.dart';
import 'package:event_management_system/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      drawer: AppDrawer(
        isLoggedIn: false, // Set this to the appropriate value
        onLoginStatusChanged:
            (bool value) {}, // Provide your callback logic here
      ),
      // endDrawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset('assets/images/logo1.jpeg', width: 36, height: 36),
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'E',
                style: TextStyle(color: Color(0xFF23223A)),
              ),
              TextSpan(
                text: 'v',
                style: TextStyle(color: Color(0xFF1CCFCF)),
              ),
              TextSpan(
                text: 'entify',
                style: TextStyle(color: Color(0xFF23223A)),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      endDrawer: AppDrawer(
        isLoggedIn: false, // Set this to the appropriate value
        onLoginStatusChanged:
            (bool value) {}, // Provide your callback logic here
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          Navigator.pushReplacementNamed(
            context,
            ['/home', '/search', '/booking', '/favourites', '/profile'][index],
          );
        },
      ),
    );
  }
}
