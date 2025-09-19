import 'package:event_management_system/Authentication/forgot_password.dart'
    show ForgotPasswordPage;
import 'package:event_management_system/Authentication/login.dart'
    show LoginPage;
import 'package:event_management_system/Authentication/reset_password.dart'
    show ResetPasswordPage;
import 'package:event_management_system/Authentication/signup.dart'
    show RegisterPage;
import 'package:event_management_system/Authentication/verify_otp.dart'
    show VerifyOtpPage;
import 'package:event_management_system/screen/booking.dart' show BookingPage;
import 'package:event_management_system/screen/favourites_page.dart';
import 'package:event_management_system/screen/home_page.dart';
import 'package:event_management_system/screen/logo.dart' show EventifyScreen;
import 'package:event_management_system/screen/search_screen.dart'
    show SearchScreen;
import 'package:event_management_system/screen/welcome_page.dart'
    show WelcomePage;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management System',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/verify_otp': (context) => const VerifyOtpPage(),
        '/reset_password': (context) => const ResetPasswordPage(),
        '/booking': (context) => const BookingPage(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const EventifyHome(),
        '/search': (context) => const SearchScreen(),
        '/favourites': (context) => const FavouritesPage(),
      },
      home: const SplashToWelcome(),
    );
  }
}

// Add this widget to handle splash -> welcome navigation
class SplashToWelcome extends StatefulWidget {
  const SplashToWelcome({super.key});

  @override
  State<SplashToWelcome> createState() => _SplashToWelcomeState();
}

class _SplashToWelcomeState extends State<SplashToWelcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const EventifyScreen(); // Your logo.dart screen
  }
}
