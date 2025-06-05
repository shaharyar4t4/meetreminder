import 'package:flutter/material.dart';
import 'package:meetreminder/screen/services/auth_services.dart';

class ViewDashbored extends StatefulWidget {
  const ViewDashbored({super.key});

  @override
  State<ViewDashbored> createState() => _ViewDashboredState();
}

class _ViewDashboredState extends State<ViewDashbored> {
  final AuthServices _authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authServices.logout();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "Logged out successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("Hello, Welcome to Dashboard!")),
    );
  }
}
