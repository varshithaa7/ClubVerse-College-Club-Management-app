import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubPageTemplate extends StatefulWidget {
  final String headerImage;
  final String clubName;
  final String section1;
  final String section2;
  //final String section3;
  final Color clr;
  final String desc1;
  final String desc2;
  final List<Map<String, String>> verticals;
  final List<Map<String, String>> projects;
  //final List<Map<String, String>> memberSpotlight;
  final List<String> photoGallery;

  ClubPageTemplate({
    required this.headerImage,
    required this.clubName,
    required this.section1,
    required this.section2,
    //required this.section3,
    required this.clr,
    required this.desc1,
    required this.desc2,
    required this.verticals,
    required this.projects,
    //required this.memberSpotlight,
    required this.photoGallery,
  });

  @override
  _ClubPageTemplateState createState() => _ClubPageTemplateState();
}

class _ClubPageTemplateState extends State<ClubPageTemplate> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _events = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addEvent(String title, String date) {
    setState(() {
      _events.add({"title": title, "date": date});
    });
  }

  void _showAddEventDialog() {
    TextEditingController titleController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Event"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: "Event Title"),
              ),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(hintText: "Event Date"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && dateController.text.isNotEmpty) {
                  _addEvent(titleController.text, dateController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: Text(widget.clubName),
        backgroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home Page Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    widget.headerImage,
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
                      Text(
                        widget.clubName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.desc1,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.desc2,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                buildSection(widget.section1, widget.verticals),
                buildUpcomingEvents(),
                buildSection(widget.section2, widget.projects),
                //buildSection(widget.section3, widget.memberSpotlight),
                buildPhotoGallery(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: widget.clr,
                        ),
                        child: Text('Join'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: widget.clr,
                        ),
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnnouncementsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            label: 'Announcements',
          ),
        ],
        selectedItemColor: widget.clr,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 69, 43, 73),
              child: const Icon(Icons.add),
              onPressed: _showAddEventDialog,
            )
          : null,
    );
  }

  Widget buildSection(String sectionTitle, List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sectionTitle,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return buildClubCard(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

 Widget buildPhotoGallery() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Photo Gallery',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 images per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: widget.photoGallery.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                widget.photoGallery[index],
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    ),
  );
}


  Widget buildUpcomingEvents() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          if (_events.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "No upcoming events.",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            )
          else
            Column(
              children: _events.map((event) {
                return ListTile(
                  leading: const Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                  title: Text(
                    event['title']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    event['date']!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget buildClubCard(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Card(
          color: const Color(0xFF2A2A3D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  item['imagePath'] ?? '',
                  height: 100.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item['title'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    item['description'] ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated Announcements Page
class AnnouncementsPage extends StatefulWidget {
  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  final List<String> _announcements = [];

  void _addAnnouncement(String announcement) {
    setState(() {
      _announcements.add(announcement);
    });
  }

  void _deleteAnnouncement(int index) {
    setState(() {
      _announcements.removeAt(index);
    });
  }

  void _showAddAnnouncementDialog() {
    TextEditingController announcementController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Announcement"),
          content: TextField(
            controller: announcementController,
            decoration: const InputDecoration(
              hintText: "Enter announcement details",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (announcementController.text.isNotEmpty) {
                  _addAnnouncement(announcementController.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
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
        title: const Text('Announcements'),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: _announcements.isEmpty
          ? const Center(
              child: Text(
                "No announcements yet.",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF2A2A3D),
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    title: Text(
                      _announcements[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteAnnouncement(index);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 69, 43, 73),
        child: const Icon(Icons.add),
        onPressed: _showAddAnnouncementDialog,
      ),
    );
  }
}
