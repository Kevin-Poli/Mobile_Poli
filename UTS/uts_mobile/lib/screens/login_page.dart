import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _errorMessage = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (_username == 'admin' && _password == 'admin123') {
        Navigator.pushReplacementNamed(
          context, 
          '/home',
          arguments: {'username': _username},
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpg'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Gambar Profil di Tengah
              CircleAvatar(
                radius: 50, // Ukuran lingkaran
                backgroundImage: AssetImage('assets/logo.png'), // Ganti dengan path gambar profil Anda
              ),
              SizedBox(height: 20), // Jarak antara gambar dan form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      onChanged: (value) => _username = value,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onChanged: (value) => _password = value,
                    ),
                    if (_errorMessage.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          _errorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 24),
                    ElevatedButton(
  onPressed: _login,
  child: Text('Login'),
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 50), backgroundColor: const Color.fromARGB(255, 189, 7, 7), // Ganti warna tombol di sini
  ),
)
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