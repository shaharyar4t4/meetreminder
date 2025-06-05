import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meetreminder/screen/auth/view_login.dart';
import 'package:meetreminder/screen/home/view_dashbored.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the connection is waiting, show a loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // If there is a user logged in, show the dashboard
        if (snapshot.hasData) {
          return const ViewDashbored();
        }
        // If no user is logged in, show the login screen
        return const VeiwLogin();
      },
    );
  }
}
