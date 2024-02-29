import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/login_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final AuthService _authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await _authService.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.power_settings_new))
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.celebration,
              color: Colors.purple,
              size: 100,
            ),
            Text(
              "You Have Succefully Login",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }
}