import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService authService = AuthService();

  User? user = FirebaseAuth.instance.currentUser;

  Future<void> logout() async {
    await authService.logout();

    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.purple.shade100,
              child: const Icon(Icons.person, size: 60, color: Colors.purple),
            ),

            const SizedBox(height: 20),

            Text(
              user?.email ?? "No Email",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.purple),
                title: const Text("Email"),
                subtitle: Text(user?.email ?? "Not Available"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.verified_user, color: Colors.purple),
                title: const Text("Account Status"),
                subtitle: Text(
                  user?.emailVerified == true ? "Verified" : "Not Verified",
                ),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month, color: Colors.purple),
                title: const Text("My Appointments"),
                subtitle: const Text("View booked appointments"),
                onTap: () {
                  // Navigate to appointments page
                },
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
