import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87), // Warna teks utama
          bodyMedium: TextStyle(color: Colors.black54), // Warna teks sekunder
          titleLarge: TextStyle(color: Colors.blueAccent, fontSize: 24, fontWeight: FontWeight.bold), // Judul
        ),
      ),
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul utama
            Text(
              'About This App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            // Deskripsi aplikasi
            Text(
              'This application serves as a demonstration of various Flutter features, including:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8),
            // Daftar fitur
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• Multi-page navigation', style: Theme.of(context).textTheme.bodyLarge),
                  Text('• Form handling and validation', style: Theme.of(context).textTheme.bodyLarge),
                  Text('• Responsive design', style: Theme.of(context).textTheme.bodyLarge),
                  Text('• State management', style: Theme.of(context).textTheme.bodyLarge),
                  Text('• User authentication (demo)', style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Informasi versi
            Text(
              'Version: 1.0.0\nDeveloped with Flutter',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 16),
            // Tambahan informasi pengembang
            Text(
              'Developed by [Your Name]\nContact: [Your Email]',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}