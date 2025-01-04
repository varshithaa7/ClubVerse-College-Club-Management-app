import 'astra.dart';
import 'carv.dart';
import 'clubs.dart';
import 'collab.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ClubVerseHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ClubVerseHomePage extends StatefulWidget {
  @override
  _ClubVerseHomePageState createState() => _ClubVerseHomePageState();
}

class _ClubVerseHomePageState extends State<ClubVerseHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ClubVerseMainPage(), // Your existing main page
    MyClubsPage(), // New My Clubs page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C1C1E),
        elevation: 0,
        title: Text('ClubVerse',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Change the current index
        });
      },
      showUnselectedLabels: false,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.purple,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: "My Clubs",
        ),
      ],
    );
  }
}

class ClubVerseMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage('images/main.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome to ClubVerse',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Manage and explore your college clubs efficiently. Stay updated with the latest events, announcements, and more.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 16),

          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                hintText: 'Search for clubs, events...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),

          // Featured Clubs
          Text(
            'Featured Clubs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarvTheatreApp()),
                    );
                  },
                  child: ClubCard(
                    title: 'CARV Club',
                    subtitle: 'Explore the world of theater...',
                    imagePath: 'images/carv.png',
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AstraRoboticsApp()),
                    );
                  },
                  child: ClubCard(
                    title: 'Astra Robotics',
                    subtitle: 'Join us to build robots...',
                    imagePath: 'images/astra.png',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // New Buttons
          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: const Color.fromARGB(87, 132, 9, 154),
                elevation: 5,
                side: BorderSide(color: Colors.white, width: 1),
              ),
              onPressed: () {
                // Navigate to a new page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClubHubApp()),
                );
              },
              child: Text('Explore all clubs',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color.fromARGB(189, 144, 45, 162),
                elevation: 5,
                side: BorderSide(color: Colors.white, width: 1),
              ),
              onPressed: () {
                // Navigate to another new page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClubManagementApp()),
                );
              },
              child: Text('Lets Collaborate!',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 16),

          // Upcoming Events
          Text(
            'Upcoming Events',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          EventCard(
            title: 'Fast-Trek',
            date: 'Jan 12, 2025',
            imagePath: 'images/trek.png',
          ),
          EventCard(
            title: 'RVSAT-1',
            date: 'Dec 31, 2025',
            imagePath: 'images/RVsat.png',
          ),
          SizedBox(height: 16),

          // Announcements
          Text(
            'Announcements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          AnnouncementCard(
            title: 'New Club Formed-Women in Cloud',
            date: 'Oct 25, 2024',
            imagePath: 'images/wic.png',
          ),
          AnnouncementCard(
            title: 'Flashmob!!',
            date: 'Dec 3, 2025',
            imagePath: 'images/flash.png',
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

  const ClubCard(
      {required this.title, required this.subtitle, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imagePath,
                height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(subtitle,
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;

  const EventCard(
      {required this.title, required this.date, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(imagePath,
                height: 80, width: 80, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(date,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;

  const AnnouncementCard(
      {required this.title, required this.date, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.asset(imagePath,
                height: 80, width: 80, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(date,
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Create the My Clubs page
class MyClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('My Clubs',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tech Clubs Section
            Text(
              'Tech Clubs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Tech Club Cards
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AstraRoboticsApp()), // Astra Robotics Club page
                      );
                    },
                    child: ClubCard(
                      title: 'Astra Robotics',
                      subtitle: 'Join us to build robots...',
                      imagePath: 'images/astra.png',
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CarvTheatreApp()), // Non-Tech Club page
                      );
                    },
                    child: ClubCard(
                      title: 'Dhruva',
                      subtitle: 'Explore the world of theater...',
                      imagePath: 'images/carv.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Non-Tech Clubs Section
            Text(
              'Non-Tech Clubs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Non-Tech Club Cards
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CarvTheatreApp()), // Non-Tech Club page
                      );
                    },
                    child: ClubCard(
                      title: 'CARV',
                      subtitle: 'Explore the world of drama...',
                      imagePath: 'images/carv.png',
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AstraRoboticsApp()), // Tech Club page
                      );
                    },
                    child: ClubCard(
                      title: 'Alaap',
                      subtitle: '',
                      imagePath: 'images/alaap[1].png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New Club Pages
class CarvClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CARV Club'),
      ),
      body: Center(child: Text('Welcome to CARV Club!')),
    );
  }
}

class AstraRoboticsClubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astra Robotics Club'),
      ),
      body: Center(child: Text('Welcome to Astra Robotics Club!')),
    );
  }
}
