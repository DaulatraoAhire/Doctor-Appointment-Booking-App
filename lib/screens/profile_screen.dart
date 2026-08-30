import 'package:flutter/material.dart';
import 'my_appointments_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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

            const Text(
              "User Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.purple),
                title: const Text("Name"),
                subtitle: const Text("User"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.purple),
                title: const Text("Email"),
                subtitle: const Text("Not Available"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_month, color: Colors.purple),
                title: const Text("My Appointments"),
                subtitle: const Text("View booked appointments"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAppointmentsScreen(),
                    ),
                  );
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logout selected")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
