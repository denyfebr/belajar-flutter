import 'package:ecommerce/presentation/auth_screen/register_screen.dart';
import 'package:ecommerce/providers/handlers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  listenLogin(){
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if(authProvider.loginState.status == DataState.success){
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.loginState.message!)),
      );
    }else if(authProvider.loginState.status == DataState.error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.loginState.message!)),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_){
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.addListener(listenLogin);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // --- Input Field Email ---
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),

            // --- Input Field Password ---
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 32.0),

            // --- Tombol Login Utama ---
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) {
                return ElevatedButton(
                  onPressed: authProvider.loginState.status == DataState.loading ? null: () {
                    authProvider.login(emailController.text, passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: authProvider.loginState.status == DataState.loading ? const CircularProgressIndicator() : Text('LOGIN', style: TextStyle(fontSize: 18)),
                );
              }
            ),
            const SizedBox(height: 32.0),

            // --- Divider ---
            const Row(
              children: <Widget>[
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("atau masuk dengan"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16.0),

            // --- Tombol OAuth Google & Facebook ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Google
                IconButton.filled(
                  icon: const Icon(Icons.g_mobiledata), // Ganti dengan logo Google yang sebenarnya jika ada
                  iconSize: 30,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login dengan Google diproses...')),
                    );
                  },
                ),
                const SizedBox(width: 20),
                // Tombol Facebook
                IconButton.filled(
                  icon: const Icon(Icons.facebook),
                  iconSize: 30,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login dengan Facebook diproses...')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 32.0),

            // --- Tombol Register ---
            OutlinedButton(
              onPressed: () {
                // Navigasi ke Halaman Register
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text('Belum punya akun? DAFTAR di sini'),
            ),
          ],
        ),
      ),
    );
  }
}