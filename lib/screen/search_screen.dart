import 'package:event_management_system/screen/drawer.dart';
import 'package:event_management_system/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Sample image list – replace with your own assets
  final List<String> _photoImages = [
    'assets/images/gate1.jpeg',
    'assets/images/gate2.jpeg',
    'assets/images/gate3.jpeg',
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
    'assets/images/balloon1.jpeg',
    'assets/images/balloon2.jpeg',
    'assets/images/balloon3.jpeg',
    'assets/images/stage1.jpeg',
    'assets/images/stage2.jpeg',
    'assets/images/stage3.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  int _currentIndex = 1; // 0 = Home, 1 = Search, … adjust if needed

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

      // Optional drawer (if you had one on home, replicate it here)

      // ------------------ MAIN BODY ------------------
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Search field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search events, venues…',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),
            // Add your search results widgets here
            // TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // ---------- Photos Grid ----------
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                      itemCount: _photoImages.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            _photoImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ------------------ BOTTOM NAV BAR ------------------
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
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
