import 'package:flutter/material.dart';

void main() {
  runApp(DhruvaClubApp());
}

class DhruvaClubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: DhruvaClubPage(),
    );
  }
}

class DhruvaClubPage extends StatefulWidget {
  @override
  _DhruvaClubPageState createState() => _DhruvaClubPageState();
}

class _DhruvaClubPageState extends State<DhruvaClubPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AnnouncementsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dhruva', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'images/dhruva.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'About Dhruva Club',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Dhruva Club is dedicated to fostering a passion for astronomy among students. From observing distant galaxies to conducting data-driven research, we aim to expand our understanding of the universe.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Our Verticals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8.0),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  _buildVerticalCard('Data-Driven Astronomy', 'images/dd.png'),
                  _buildVerticalCard('Optical Astronomy', 'images/oa.png'),
                  _buildVerticalCard('Radio Astronomy', 'images/ra.png'),
                  _buildVerticalCard('Research', 'images/research.png'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8.0),
              _buildEventCard('Star Gazing Night', 'Example Date'),
              _buildEventCard('Astronomy Data Hackathon', 'Example Date'),
              _buildEventCard(
                  'Guest Lecture on Radio Astronomy', 'Example Date'),
              SizedBox(height: 16.0),
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8.0),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  _buildGalleryImage('images/project1.png'),
                  _buildGalleryImage('images/gallery2.png'),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              SizedBox(height: 8.0),
              Column(
                children: [
                  _buildProjectCard(
                    'images/LIGO.png',
                    'LIGO',
                    'LIGO is a global network of observatories that detects and measures cosmic gravitational waves for scientific research.',
                  ),
                  _buildProjectCard(
                    'images/nanograv.png',
                    'Nanograv',
                    'The North American Nanohertz Observatory for Gravitational Waves (NANOGrav) is a collaboration of researchers who are actively engaged in using North American radio telescopes to detect and study gravitational waves via pulsar timing.',
                  ),
                  _buildProjectCard(
                    'images/h21.jpg',
                    'H21',
                    'H21 can refer to an open cluster in the Cassiopeia constellation and the hydrogen 21-cm line in astronomy',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Join Dhruva Club',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Become a part of Dhruva Club and embark on a journey through the cosmos. Learn, observe, and discover with us.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Join Now'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalCard(String title, String imagePath) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, String date) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(date, style: TextStyle(color: Colors.white70)),
        trailing: Icon(Icons.chevron_right, color: Colors.purple),
        onTap: () {},
      ),
    );
  }

  Widget _buildGalleryImage(String assetPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProjectCard(String imagePath, String title, String description) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.asset(
              imagePath,
              height: 150,
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 4.0),
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

class AnnouncementsPage extends StatefulWidget {
  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final List<Map<String, String>> _announcements = [];

  void _addAnnouncement() {
    showDialog(
      context: context,
      builder: (context) {
        String title = "";
        String description = "";

        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'New Announcement',
            style: TextStyle(color: Colors.purple),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 8.0),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && description.isNotEmpty) {
                  setState(() {
                    _announcements.add({
                      'title': title,
                      'description': description,
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add', style: TextStyle(color: Colors.purple)),
            ),
          ],
        );
      },
    );
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: _announcements.length,
        itemBuilder: (context, index) {
          final announcement = _announcements[index];
          return Card(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: ListTile(
              title: Text(
                announcement['title']!,
                style: TextStyle(color: Colors.purple),
              ),
              subtitle: Text(
                announcement['description']!,
                style: TextStyle(color: Colors.white70),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.purple),
                onPressed: () => _deleteAnnouncement(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAnnouncement,
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
