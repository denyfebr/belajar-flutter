import 'package:ecommerce/data/model/auth/DetailUser.dart';
import 'package:ecommerce/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../providers/handlers.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // Data dummy pengguna
  final String userName = "Budi Santoso";
  final String userEmail = "budi.santoso@example.com";

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar dari akun ini?'),
          actions: <Widget>[
            // Tombol BATAL
            TextButton(
              child: const Text('BATAL', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            // Tombol LOGOUT
            TextButton(
              child: const Text('LOGOUT', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _performLogout(); // Lakukan proses logout
              },
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk melakukan proses logout dan navigasi
  void _performLogout() async{

    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    await userProvider.logout();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil Logout')),
    );
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<AuthProvider>(context, listen: false);
    userProvider.detailUser();
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil Pengguna'),
          centerTitle: true,
        ),
        body: Consumer<AuthProvider>(
          builder: (context, auth,_) {
            bool isSuccess = auth.detailUserState.isSuccess();
            User? data;
            if(isSuccess){
              data = auth.detailUserState.data;
            }
            return Skeletonizer(
              enabled: auth.detailUserState.isLoading(),

              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // --- Gambar User Placeholder ---
                      Center(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            isSuccess ? data!.name![0].toUpperCase() : userName[0].toUpperCase(), // Inisial nama
                            style: const TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          // Anda bisa ganti dengan NetworkImage atau AssetImage jika ada gambar
                          // backgroundImage: NetworkImage('URL_GAMBAR_PROFIL_ANDA'),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // --- Nama dan Email ---
                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(isSuccess ? data!.name! : userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: const Text('Nama Lengkap'),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Card(
                        elevation: 2,
                        child: ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(isSuccess ? data!.email! : userEmail, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: const Text('Email'),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // --- Tombol Logout ---
                      ElevatedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text('LOGOUT'),
                        onPressed: _showLogoutDialog, // Panggil dialog
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            );
          }
        ),
        );
    }
}