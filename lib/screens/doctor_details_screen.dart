import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String rating;

  const DoctorDetailsScreen({
    super.key,
    required this.doctorName,
    required this.speciality,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        title: const Text(
          'Doctor Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Image
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade50,
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.blue.shade700,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Doctor Name
            Center(
              child: Text(
                doctorName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 5),

            // Speciality
            Center(
              child: Text(
                speciality,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ),

            const SizedBox(height: 10),

            // Rating
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 5),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // About Doctor
            const Text(
              'About Doctor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '$doctorName is an experienced $speciality '
                  'who provides professional consultation and '
                  'quality healthcare services to patients.',
                  style: const TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Available Slots
            const Text(
              'Available Time Slots',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _timeSlot('09:00 AM'),
                _timeSlot('10:00 AM'),
                _timeSlot('11:00 AM'),
                _timeSlot('02:00 PM'),
                _timeSlot('04:00 PM'),
                _timeSlot('06:00 PM'),
              ],
            ),

            const SizedBox(height: 30),

            // Book Appointment Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingScreen(
                        doctorName: doctorName,
                        speciality: speciality,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeSlot(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: Text(
        time,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
      ),
    );
  }
}
