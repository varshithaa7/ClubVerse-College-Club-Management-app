import 'package:flutter/material.dart';

void main() => runApp(AstraRoboticsApp());

class AstraRoboticsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              color: Colors.white), // Replacing bodyText2 with bodyMedium
        ),
      ),
      home: AstraRoboticsClubPage(),
    );
  }
}

class AstraRoboticsClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        title: Text('Astra Robotics Club'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Club Header Image and Welcome Text
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/astra.png', // Replace with your image asset
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to Astra Robotics Club',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Explore the world of robotics with Astra, where innovation meets creativity. Join us in our mission to build, learn, and grow with cutting-edge technology.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),

              // Our Verticals Section
              Text(
                'Our Verticals',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ClubCard(
                      title: 'Robotics Workshop',
                      subtitle: 'Hands-on training on building robots',
                      imagePath:
                          'https://example.com/workshop.jpg', // Replace with asset
                    ),
                  ),
                  SizedBox(width: 16, height:16,),
                  Expanded(
                    child: ClubCard(
                      title: 'AI Seminar',
                      subtitle: 'Insights into the world of AI',
                      imagePath:
                          'https://example.com/seminar.jpg', // Replace with asset
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Upcoming Events Section
              Text(
                'Upcoming Events',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ClubCard(
                      title: 'Autonomous Vehicle',
                      subtitle: 'Developing a self-driving car',
                      imagePath:
                          'https://example.com/vehicle.jpg', // Replace with asset
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ClubCard(
                      title: 'Robotic Arm',
                      subtitle: 'A precision robotic arm project',
                      imagePath:
                          'https://example.com/arm.jpg', // Replace with asset
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Our Projects Section
              Text(
                'Our Projects',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProjectCard(
                      imagePath:
                          'https://example.com/project1.jpg', // Replace with asset
                    ),
                    SizedBox(width: 12),
                    ProjectCard(
                      imagePath:
                          'https://example.com/project2.jpg', // Replace with asset
                    ),
                    SizedBox(width: 12),
                    ProjectCard(
                      imagePath:
                          'https://example.com/project3.jpg', // Replace with asset
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Admin Spotlight Section
              Text(
                'Admin Spotlight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AdminCard(
                      name: 'John Doe',
                      description: 'A seasoned actor known for...',
                      imagePath:
                          'https://example.com/johndoe.jpg', // Replace with asset
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AdminCard(
                      name: 'John Doe',
                      description: 'A seasoned actor known for...',
                      imagePath:
                          'https://example.com/johndoe.jpg', // Replace with asset
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Join and Register Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Your button action
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Text/Icon color
                      backgroundColor: Colors.blue, // Background color
                    ),
                    child: Text('Join Us'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF6E4AD9), // Text/Icon color
                      backgroundColor: Colors.blue,
                      // Register button color
                    ),
                    child: Text('Register'),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Footer
              Center(
                child: Column(
                  children: [
                    Text(
                      '© 2023 ClubHub. All rights reserved.',
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'About Us | Contact',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1C1C1E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

class ClubCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const ClubCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String imagePath;

  const ProjectCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          imagePath,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  final String name;
  final String description;
  final String imagePath;

  const AdminCard({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imagePath,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
