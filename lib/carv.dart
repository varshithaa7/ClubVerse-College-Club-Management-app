import 'package:flutter/material.dart';

void main() {
  runApp(const CarvTheatreApp());
}

class CarvTheatreApp extends StatelessWidget {
  const CarvTheatreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CarvTheatrePage(),
    );
  }
}

class CarvTheatrePage extends StatefulWidget {
  const CarvTheatrePage({Key? key}) : super(key: key);

  @override
  State<CarvTheatrePage> createState() => _CarvTheatrePageState();
}

class _CarvTheatrePageState extends State<CarvTheatrePage> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _announcements = [];
  final List<Map<String, String>> _events = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addAnnouncement(String title, String description) {
    setState(() {
      _announcements.add({'title': title, 'description': description});
    });
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  void _addEvent(String title, String description, String imagePath) {
    setState(() {
      _events.add(
          {'title': title, 'description': description, 'imagePath': imagePath});
    });
  }

  void _deleteEvent(int index) {
    setState(() {
      _events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARV Theatre Club'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomePage(context),
          _buildAnnouncementsPage(context),
          //const Center(child: Text('Other Page', style: TextStyle(fontSize: 20))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.more_horiz),
          //   label: 'Other',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () => _showAddEventDialog(context),
              child: const Icon(Icons.add),
            )
          : _selectedIndex == 1
              ? FloatingActionButton(
                  onPressed: () => _showAddAnnouncementDialog(context),
                  child: const Icon(Icons.add),
                )
              : null,
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'images/carvbanner.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CARV Theatre Club',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Unleash Your Acting Potential',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                const Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'CARV Theatre Club is a community of passionate theatre enthusiasts dedicated to bringing the magic of live performances to life. Our club offers a platform for aspiring actors, directors, and... ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Upcoming Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ..._events.asMap().entries.map((entry) {
                  final index = entry.key;
                  final event = entry.value;
                  return Dismissible(
                    key: Key(event['title']!),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) => _deleteEvent(index),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: EventCard(
                        title: event['title']!,
                        description: event['description']!,
                        imagePath: event['imagePath']!,
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
                const Text(
                  'Our Verticals',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Expanded(
                      child: VerticalCard(
                        title: 'English CARV',
                        imagePath: 'images/aurora.png',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: VerticalCard(
                        title: 'Kan CARV',
                        imagePath: 'images/carvbanner.png',
                      ),
                    ),
                    Expanded(
                      child: VerticalCard(
                        title: 'Hindi CARV',
                        imagePath: 'images/carvgallery5.jpg',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Members Spotlight',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Expanded(
                      child: MemberCard(
                        name: 'Nithya J',
                        imagePath: 'assets/member1.jpg',
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: MemberCard(
                        name: 'M L Varshitha',
                        imagePath: 'assets/member2.jpg',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Photo Gallery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(
                      6,
                      (index) =>
                          PhotoTile(imagePath: 'images/carvgallery$index.jpg')),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Join'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple),
                        onPressed: () {},
                        child: const Text('Contact'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Contact us at contact@carvtheatreclub.com or call...',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementsPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _announcements.isEmpty
          ? Center(
              child: Text(
                'No announcements yet',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                final announcement = _announcements[index];
                return Dismissible(
                  key: Key(announcement['title']!),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) => _deleteAnnouncement(index),
                  child: AnnouncementBox(
                    title: announcement['title']!,
                    description: announcement['description']!,
                  ),
                );
              },
            ),
    );
  }

  void _showAddAnnouncementDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Announcement'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _addAnnouncement(
                      titleController.text, descriptionController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddEventDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController imageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: imageController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    imageController.text.isNotEmpty) {
                  _addEvent(titleController.text, descriptionController.text,
                      imageController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const EventCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imagePath, height: 150, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const VerticalCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const MemberCard({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 8),
        Text(name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class PhotoTile extends StatelessWidget {
  final String imagePath;

  const PhotoTile({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

class AnnouncementBox extends StatelessWidget {
  final String title;
  final String description;

  const AnnouncementBox({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
