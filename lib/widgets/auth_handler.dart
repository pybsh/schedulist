import 'package:flutter/material.dart';
import 'package:schedulist/screens/auth_screen.dart';
import 'package:schedulist/screens/main_screen.dart';
import 'package:schedulist/services/auth_service.dart';

class AuthHandler extends StatefulWidget {
  const AuthHandler({super.key});

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isUserSignedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final isSignedIn = snapshot.data ?? false;
          return isSignedIn ? MainScreen() : AuthScreen();
        }
      },
    );
  }
}
