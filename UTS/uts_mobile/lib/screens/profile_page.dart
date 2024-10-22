import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final username = args?['username'] ?? 'User';

   return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 78, 9, 4),
      ),
      body: Center(
        child: Container(
          // Tambahkan latar belakang di belakang Card
          decoration: BoxDecoration(
            color: Colors.grey[200], // Atur warna latar belakang
          ),
          child: Card(
            margin: EdgeInsets.all(16),
            // Atur warna latar belakang Card
            color: const Color.fromARGB(255, 226, 148, 3),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Text(
                      username[0].toUpperCase(),
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Username: $username',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Role: Demo User',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}