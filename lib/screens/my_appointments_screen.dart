import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatefulWidget {
  const MyAppointmentsScreen({super.key});

  @override
  State<MyAppointmentsScreen> createState() =>
      _MyAppointmentsScreenState();
}

class _MyAppointmentsScreenState extends State<MyAppointmentsScreen> {
  int selectedTab = 0;

  final List<Map<String, String>> upcomingAppointments = [
    {
      'doctor': 'Dr. Rahul Sharma',
      'speciality': 'Cardiologist',
      'date': '28 Aug 2026',
      'time': '10:30 AM',
    },
    {
      'doctor': 'Dr. Priya Patil',
      'speciality': 'Dentist',
      'date': '30 Aug 2026',
      'time': '02:00 PM',
    },
  ];

  final List<Map<String, String>> completedAppointments = [
    {
      'doctor': 'Dr. Amit Joshi',
      'speciality': 'Dermatologist',
      'date': '20 Aug 2026',
      'time': '11:00 AM',
    },
  ];

  final List<Map<String, String>> cancelledAppointments = [];

  List<Map<String, String>> get currentAppointments {
    if (selectedTab == 0) {
      return upcomingAppointments;
    } else if (selectedTab == 1) {
      return completedAppointments;
    } else {
      return cancelledAppointments;
    }
  }

  void cancelAppointment(int index) {
    final appointment = upcomingAppointments[index];

    setState(() {
      cancelledAppointments.add(appointment);
      upcomingAppointments.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Appointment cancelled successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Appointments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          // Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                _tabButton('Upcoming', 0),
                _tabButton('Completed', 1),
                _tabButton('Cancelled', 2),
              ],
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: currentAppointments.isEmpty
                ? const Center(
                    child: Text(
                      'No appointments found',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: currentAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = currentAppointments[index];

                      return Card(
                        margin: const EdgeInsets.only(bottom: 15),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: Colors.blue.shade50,
                                    child: Icon(
                                      Icons.person,
                                      size: 32,
                                      color: Colors.blue.shade700,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          appointment['doctor']!,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          appointment['speciality']!,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Text(
                                    selectedTab == 0
                                        ? 'Upcoming'
                                        : selectedTab == 1
                                            ? 'Completed'
                                            : 'Cancelled',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedTab == 0
                                          ? Colors.blue
                                          : selectedTab == 1
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 15),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(appointment['date']!),
                                  const SizedBox(width: 20),
                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(appointment['time']!),
                                ],
                              ),

                              if (selectedTab == 0) ...[
                                const SizedBox(height: 15),

                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Cancel Appointment?',
                                            ),
                                            content: const Text(
                                              'Are you sure you want to cancel this appointment?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('No'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  cancelAppointment(index);
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'Cancel Appointment',
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTab = index;
            });
          },
          child: Text(title),
        ),
      ),
    );
  }
}