import 'package:flutter/material.dart';

void main() {
  runApp(CodingClubApp());
}

class CodingClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: CodingHomePage(),
    );
  }
}

class CodingHomePage extends StatefulWidget {
  @override
  _CodingHomePageState createState() => _CodingHomePageState();
}

class _CodingHomePageState extends State<CodingHomePage> {
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
        title: Text('Coding Club'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.blue),
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
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
            icon: Icon(Icons.code),
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

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<Map<String, String>> _events = [
    {'title': 'Hackathon Kickoff', 'date': 'Dec 25, 2024'},
    {'title': 'AI Workshop', 'date': 'Jan 10, 2025'},
  ];
  void _addEvent(String title, String date) {
    setState(() {
      _events.add({'title': title, 'date': date});
    });
  }

  final List<String> _photos = [
    'images/ccgal1.png', // Replace with actual URLs or asset paths
    'images/ccgal2.png',
    'images/ccgal3.png',
    'images/ccgal4.png',
    'images/ccgal5.png',
    'images/ccgal6.png',

    // Add more URLs or paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://media.licdn.com/dms/image/v2/C561BAQHxHMPx7k7bSA/company-background_1536_768/company-background_1536_768/0/1584380864159?e=2147483647&v=beta&t=XQrvtZOoj0IVvEwuTHDceXBg8OeKh3hjXlcXIEZ9Ed8',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'About Coding Club',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'The Coding Club is dedicated to fostering programming and tech skills through collaboration, innovation, and learning.',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upcoming Events Section
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
          itemCount: _events.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.black,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  _events[index]['title']!,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  _events[index]['date']!,
                  style: TextStyle(color: Colors.white70),
                ),
                leading: Icon(Icons.event, color: Colors.blue),
              ),
            );
          },
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Show the dialog to add a new event
            _showAddEventDialog();
          },
          child: Text('Add Event'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),

        // Photo Gallery Section
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Photo Gallery',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        // GridView to display photos
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 400, // Adjust the height to fit two rows of images
          child: GridView(
            shrinkWrap: true, // This prevents scrolling
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of images per row
              crossAxisSpacing: 8, // Space between columns
              mainAxisSpacing: 8, // Space between rows
            ),
            children: _photos.map((photo) {
              return Card(
                color: Colors.black,
                child: Image.network(
                  photo, // Replace with your image URL or asset path
                  fit: BoxFit.cover,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // Widget _buildUpcomingEvents() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.all(16),
  //         child: Text(
  //           'Upcoming Events',
  //           style: TextStyle(
  //               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  //         ),
  //       ),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: _events.length,
  //         itemBuilder: (context, index) {
  //           return Card(
  //             color: Colors.black,
  //             margin: EdgeInsets.all(8),
  //             child: ListTile(
  //               title: Text(
  //                 _events[index]['title']!,
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               subtitle: Text(
  //                 _events[index]['date']!,
  //                 style: TextStyle(color: Colors.white70),
  //               ),
  //               leading: Icon(Icons.event, color: Colors.blue),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  void _showAddEventDialog() {
    String title = '';
    String date = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Add Event',
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
                onChanged: (value) => date = value,
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && date.isNotEmpty) {
                  _addEvent(title, date);
                  Navigator.pop(context);
                }
              },
              child: Text('Add', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}

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
            title: 'Project 1: AI Chatbot',
            description:
                'An AI-powered chatbot designed for seamless communication.',
          ),
          _buildProjectTile(
            context,
            title: 'Project 2: College Management System',
            description: 'A complete solution for managing college activities.',
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
        title: Text(title, style: TextStyle(color: Colors.blue)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.arrow_forward, color: Colors.blue),
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
                  color: Colors.blue),
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

class ProfilePage extends StatelessWidget {
  final List<String> currentProjects = [
    'AI Chatbot',
    'College Management System',
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
                  color: Colors.blue),
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
              child: Text('Upload Resume'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

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
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  setState(() {
                    _announcements
                        .add({'title': title, 'description': description});
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Add', style: TextStyle(color: Colors.blue)),
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
      ),
      body: ListView.builder(
        itemCount: _announcements.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                _announcements[index]['title']!,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                _announcements[index]['description']!,
                style: TextStyle(color: Colors.white70),
              ),
              leading: Icon(Icons.announcement, color: Colors.blue),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAnnouncement,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
