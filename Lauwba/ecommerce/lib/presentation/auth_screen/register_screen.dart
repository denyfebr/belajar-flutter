import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Akun Baru'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- Input Field Nama ---
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- Input Field Email ---
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- Input Field Password ---
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- Input Field Retype Password ---
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Ulangi Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock_reset),
              ),
            ),
            const SizedBox(height: 32.0),

            // --- Tombol Submit (Register) ---
            ElevatedButton(
              onPressed: () {
                // Logika pendaftaran dan redirect ke halaman login
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pendaftaran berhasil! Mengarahkan ke halaman Login...')),
                );
                // Redirect ke halaman login setelah pendaftaran
                Navigator.pop(context); // Pop akan kembali ke halaman sebelumnya (LoginPage)
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('SUBMIT & DAFTAR', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16.0),

            // --- Tombol Kembali ke Login ---
            TextButton(
              onPressed: () {
                // Kembali ke halaman login
                Navigator.pop(context);
              },
              child: const Text('Sudah punya akun? Kembali ke Login'),
            ),
          ],
        ),
      ),
    );
  }
}