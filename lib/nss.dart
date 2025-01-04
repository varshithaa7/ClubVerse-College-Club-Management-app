import 'package:flutter/material.dart';

class NSSClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NSSWelcomeScreen(),
    );
  }
}

class NSSWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF212121), // Dark Gray Background
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circle Avatar for the image
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm7fJX_ij8C_CYV_yIlU_sH9vjHUMPtlEO8CUCz0wToiZKXwD8TFg6WiBRM_VMrnugOuY&usqp=CAU",
              ), // Image URL
            ),
            SizedBox(height: 20),
            Text(
              "Welcome to NSS Club",
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Join hands to serve the community and grow together.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70, // White text
                fontSize: 16,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 10),
            // Tagline
            Text(
              "Not me but you",
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 40),
            // Button to navigate to Featured Events
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF96130D), // Purple color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Explore Events",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Announcements
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF96130D), // Purple color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Explore Announcements",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to navigate to Members
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MembersPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF96130D), // Purple color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Explore Members",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF96130D), // Purple color
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EventsPage extends StatelessWidget {
  final List<String> featuredEvents = [
    "Blood Donation Camp - Oct 5, 2024",
    "Tree Plantation Drive - Nov 10, 2024",
    "Community Awareness Workshop - Dec 15, 2024"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NSS RVCE",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF96130D), // Purple color
      ),
      backgroundColor: Color(0xFF212121), // Dark Gray Background
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Events Title
            Text(
              "Featured Events",
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Event List
            ...featuredEvents.map((event) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.event, color: Colors.white70),
                  title: Text(
                    event,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
  final List<String> announcements = [
    "New NSS chapter launched at RV College!",
    "Upcoming meeting: Plan for Annual NSS Day",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NSS RVCE",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF96130D), // Purple color
      ),
      backgroundColor: Color(0xFF212121), // Dark Gray Background
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Announcements Title
            Text(
              "Announcements",
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Announcements List
            ...announcements.map((announcement) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.campaign, color: Colors.white70),
                  title: Text(
                    announcement,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MembersPage extends StatelessWidget {
  final List<Map<String, String>> members = [
    {
      'role': 'President',
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '+1234567890',
    },
    {
      'role': 'Vice President',
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'phone': '+1234567891',
    },
    {
      'role': 'Core Member',
      'name': 'Alice Brown',
      'email': 'alice.brown@example.com',
      'phone': '+1234567892',
    },
    {
      'role': 'Core Member',
      'name': 'Bob Johnson',
      'email': 'bob.johnson@example.com',
      'phone': '+1234567893',
    },
    {
      'role': 'Core Member',
      'name': 'Eve Davis',
      'email': 'eve.davis@example.com',
      'phone': '+1234567894',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Members",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF96130D), // Purple color
      ),
      backgroundColor: Color(0xFF212121), // Dark Gray Background
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Color(0xFF616161), // Ash gray background color
            child: ListTile(
              title: Text(
                '${member['role']}: ${member['name']}',
                style: TextStyle(
                  color: Colors.white, // White text
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Email: ${member['email']}',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                  Text(
                    'Phone: ${member['phone']}',
                    style: TextStyle(color: Colors.white), // White text
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF96130D), // Purple color
      ),
      backgroundColor: Color(0xFF212121), // Dark Gray Background
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150", // Placeholder Image
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "john.doe@example.com",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            // Registered Events Section
            Text(
              "Registered Events",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "No events registered yet.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
            // POC Details Section
            Text(
              "POC Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "No POC details available.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
