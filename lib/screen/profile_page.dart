import 'package:event_management_system/screen/change_password.dart';
import 'package:event_management_system/screen/drawer.dart';
import 'package:event_management_system/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // Dummy user data
    const user = {
      'name': 'Surja Bist',
      'email': 'surja@example.com',
      'phone': '+91 9876543210',
      'image': 'assets/profile.jpeg', // Make sure this asset exists
    };

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        isLoggedIn: false, // Set this to the appropriate value
        onLoginStatusChanged:
            (bool value) {}, // Provide your callback logic here
      ),
      // endDrawer: const AppDrawer(),
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user['image']!),
            ),
            const SizedBox(height: 20),
            Text(
              user['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user['email']!,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Text(
              user['phone']!,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Profile'),
              onTap: () {
                // Implement edit profile navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.orange),
              title: const Text('Change Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout logic
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
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
