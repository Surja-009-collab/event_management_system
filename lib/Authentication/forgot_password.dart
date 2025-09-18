import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement reset password logic (send OTP)
      Navigator.pushReplacementNamed(context, '/verify_otp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              // App logo
              Image.asset('assets/images/logo1.jpeg', width: 100, height: 100),
              const SizedBox(height: 12),
              // Stylized Eventify text
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Sans',
                  ),
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
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        "Enter your email address and we'll send you an OTP to reset your password.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                      const SizedBox(height: 28),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.black54,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: const TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black26),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Use the same _GradientButton as Sign In
                      SizedBox(
                        width: double.infinity,
                        child: _GradientButton(
                          onPressed: _resetPassword,
                          child: const Text('Reset Password'),
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          'Back to Login',
                          style: TextStyle(
                            color: Color(0xFFE573B7),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Copy the _GradientButton widget from login.dart here
class _GradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _GradientButton({required this.onPressed, required this.child});

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xFF8F5CFF),
        Color.fromARGB(182, 127, 34, 225),
      ], // Purple shades
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: _isHovering ? null : gradient,
          color: _isHovering ? Colors.white : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            foregroundColor: _isHovering
                ? const Color(0xFF08182B)
                : Colors.white,
          ),
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}
