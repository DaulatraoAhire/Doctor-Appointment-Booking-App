import 'package:flutter/material.dart';
import 'doctor_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'All';

  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Rahul Sharma',
      'speciality': 'Cardiologist',
      'rating': '4.8',
    },
    {
      'name': 'Dr. Priya Patil',
      'speciality': 'Dentist',
      'rating': '4.7',
    },
    {
      'name': 'Dr. Amit Joshi',
      'speciality': 'Dermatologist',
      'rating': '4.9',
    },
    {
      'name': 'Dr. Neha Kulkarni',
      'speciality': 'Neurologist',
      'rating': '4.6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = selectedCategory == 'All'
        ? doctors
        : doctors
            .where(
              (doctor) =>
                  doctor['speciality'] == selectedCategory,
            )
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Doctors',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search doctors...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Filter categories
            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryButton('All'),
                  _categoryButton('Cardiologist'),
                  _categoryButton('Dentist'),
                  _categoryButton('Dermatologist'),
                  _categoryButton('Neurologist'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Doctors
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue.shade700,
                        ),
                      ),

                      title: Text(
                        doctor['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${doctor['speciality']} • ⭐ ${doctor['rating']}',
                      ),

                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DoctorDetailsScreen(
                                doctorName: doctor['name']!,
                                speciality: doctor['speciality']!,
                                rating: doctor['rating']!,
                              ),
                            ),
                          );
                        },
                        child: const Text('View'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String category) {
    final isSelected = selectedCategory == category;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }
}