import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final username = args?['username'] ?? 'User ';

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bghome.jpg'), // Ganti dengan path gambar Anda
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: const Color.fromARGB(255, 105, 4, 4)),
              child: Text(
                'Welcome, $username!',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile', arguments: {'username': username});
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      body: Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/bghome.jpg'), // Ganti dengan path gambar Anda
      fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
    ),
  ),
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome to the Home Page',
          style: TextStyle(fontSize: 24, color: Colors.white), // Mengubah warna teks agar kontras
        ),
        SizedBox(height: 20),
        Text(
          'You are logged in as: $username',
          style: TextStyle(fontSize: 18, color: Colors.white), // Mengubah warna teks agar kontras
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.star, color: Colors.white), // Mengubah warna ikon agar kontras
                title: Text('Airplanes', style: TextStyle(color: Colors.white)), // Mengubah warna teks agar kontras
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Tanks', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Ships', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Premiums', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
    );
  }
}