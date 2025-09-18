import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset('assets/images/logo1.jpeg', width: 36, height: 36),
        ),
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sans',
            ),
            children: [
              TextSpan(
                text: 'E',
                style: TextStyle(color: Color(0xFF23223A)),
              ),
              TextSpan(
                text: 'v',
                style: TextStyle(
                  color: Color(0xFF1CCFCF),
                ), // Different color for 'v'
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
            icon: const Icon(Icons.menu, color: Color(0xFF23223A)),
            onPressed: () {
              // TODO: Open drawer or menu
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/wed.jpeg', // Replace with your banner image
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WELCOME TO EVENTIFY',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Bookings Open for September!!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                              ),
                              onPressed: () {
                                // TODO: Book now action
                              },
                              icon: const Icon(Icons.open_in_new, size: 18),
                              label: const Text('Book now!'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Event Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _CategoryCard(
                    icon: Icons.cake,
                    label: 'Birthday Parties',
                    color: Colors.white, // Card background
                    iconColor: Color(0xFFB39DDB), // Lavender icon
                  ),
                  _CategoryCard(
                    icon: Icons.favorite,
                    label: 'Weddings',
                    color: Colors.white,
                    iconColor: Color(0xFFF06292), // Pink icon
                  ),
                  _CategoryCard(
                    icon: Icons.local_bar,
                    label: 'Cocktail Parties',
                    color: Colors.white,
                    iconColor: Color(0xFF4FC3F7), // Blue icon
                  ),
                  _CategoryCard(
                    icon: Icons.style,
                    label: 'Fashion Show',
                    color: Colors.white,
                    iconColor: Color(0xFF80CBC4), // Mint icon
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Top Venues Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Venues',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      minimumSize: MaterialStateProperty.all(const Size(0, 0)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: MaterialStateProperty.all(
                        Color(0xFFE573B7),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      // TODO: View all venues
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFFE573B7),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              // Top Venues List
              SizedBox(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _VenueCard(
                      image: 'assets/images/venue1.jpg',
                      name: 'Kwality Durbar Banquet',
                      location: 'Surat, Gujarat',
                      price: '₹ 5000',
                      halls: '2',
                      capacity: '500',
                    ),
                    _VenueCard(
                      image: 'assets/images/venue2.jpg',
                      name: 'Heritage Garden',
                      location: 'Patna, Bihar',
                      price: '₹ 7000',
                      halls: '3',
                      capacity: '300',
                    ),
                    _VenueCard(
                      image: 'assets/images/venue3.jpg',
                      name: 'Royal Place',
                      location: 'Pune, Mumbai',
                      price: '₹ 10000',
                      halls: '4',
                      capacity: '900',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8F5CFF),
        unselectedItemColor: const Color.fromARGB(255, 73, 73, 73),
        currentIndex: 0,
        onTap: (index) {
          // TODO: Handle navigation
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Category Card Widget
class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color iconColor;
  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        width: 80,
        height: 90,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // TODO: Navigate to category
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 32),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Venue Card Widget
class _VenueCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String price;
  final String halls;
  final String capacity;
  const _VenueCard({
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.halls,
    required this.capacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 80,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.currency_rupee,
                        size: 14,
                        color: Colors.pink,
                      ),
                      Text(price, style: const TextStyle(fontSize: 13)),
                      const Spacer(),
                      const Icon(
                        Icons.meeting_room,
                        size: 14,
                        color: Colors.purple,
                      ),
                      Text(' $halls', style: const TextStyle(fontSize: 13)),
                      const Spacer(),
                      const Icon(Icons.people, size: 14, color: Colors.blue),
                      Text(' $capacity', style: const TextStyle(fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF48FB1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // TODO: Book venue
                      },
                      child: const Text('Book Now'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
