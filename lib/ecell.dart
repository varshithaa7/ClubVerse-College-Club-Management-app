import 'package:flutter/material.dart';

void main() {
  runApp(ECellClubApp());
}

class ECellClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: ECellHomePage(),
    );
  }
}

class ECellHomePage extends StatefulWidget {
  @override
  _ECellHomePageState createState() => _ECellHomePageState();
}

class _ECellHomePageState extends State<ECellHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    ProjectsPage(),
    AnnouncementsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Cell Club'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://ecellrvce.in/home_images/socialshareecell.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'About E-Cell Club',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The E-Cell Club inspires entrepreneurship and innovation among students, fostering a culture of creativity and business acumen.',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16.0),
            _buildUpcomingEvents(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    final events = [
      {'title': 'Startup Ideathon', 'date': 'Dec 28, 2024'},
      {'title': 'Pitch Fest', 'date': 'Jan 15, 2025'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Upcoming Events',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: events.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  events[index]['title']!,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  events[index]['date']!,
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.event, color: Colors.white),
              ),
            );
          },
        ),
      ],
    );
  }
}

// ProjectsPage
class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildProjectTile(
            context,
            title: 'Project 1: Startup Management',
            description: 'A platform to help startups manage operations.',
          ),
          _buildProjectTile(
            context,
            title: 'Project 2: Business Networking App',
            description: 'An app to connect entrepreneurs and investors.',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectTile(BuildContext context,
      {required String title, required String description}) {
    return Card(
      color: Colors.black,
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProjectDetailPage(title: title, description: description),
            ),
          );
        },
      ),
    );
  }
}

// ProjectDetailPage
class ProjectDetailPage extends StatelessWidget {
  final String title;
  final String description;

  ProjectDetailPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

// ProfilePage
class ProfilePage extends StatelessWidget {
  final List<String> currentProjects = [
    'Startup Management',
    'Business Networking App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Projects',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8.0),
            ...currentProjects.map(
              (project) => Text(
                '- $project',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement resume upload functionality here
              },
              child: Text(
                'Upload Resume',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// AnnouncementsPage
class AnnouncementsPage extends StatefulWidget {
  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final List<Map<String, String>> _announcements = [];

  void _addAnnouncement() {
    String title = '';
    String description = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Add Announcement',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => title = value,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                onChanged: (value) => description = value,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _announcements.add({
                    'title': title,
                    'description': description,
                  });
                });
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: _addAnnouncement,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _announcements.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _announcements[index]['title']!,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              _announcements[index]['description']!,
              style: TextStyle(color: Colors.white70),
            ),
          );
        },
      ),
    );
  }
}
