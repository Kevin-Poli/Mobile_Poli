import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg2.png'), // Ganti dengan path gambar Anda
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(150, 114, 3, 3), // Warna merah dengan transparansi tinggi
            const Color.fromARGB(150, 136, 151, 3), // Warna hijau kekuningan dengan transparansi tinggi
          ],
),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menambahkan logo di atas teks
              Image.asset(
                'assets/logo.png', 
                width: 100, // Atur lebar logo sesuai kebutuhan
                height: 100, // Atur tinggi logo sesuai kebutuhan
              ),
              SizedBox(height: 20), // Jarak antara logo dan teks
              Text(
                'Welcome to My App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}