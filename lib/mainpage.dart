import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/firebase_options.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

// class MainApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: MainPage(),
//     );
//   }
// }
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/', // Set the initial route to MainPage
      routes: {
        '/': (context) => MainPage(), // Main page route
        '/login': (context) => LoginPage(), // Login page route
        '/signup': (context) => SignUpPage(), // Signup page route
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      "RV COLLEGE OF ENGINEERING",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Image.asset(
                      'images/logo.png',
                      width: 300,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to Clubverse",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Clubverse is your one-stop platform to explore, connect, and engage with all the clubs at RV College of Engineering.",
                      style: TextStyle(fontSize: 14, color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Image.asset(
              'images/RV.png', // Replace with your image path
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
