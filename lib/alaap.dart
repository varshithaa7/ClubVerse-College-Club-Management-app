import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlaapHomePage extends StatefulWidget {
  @override
  _AlaapHomePageState createState() => _AlaapHomePageState();
}

class _AlaapHomePageState extends State<AlaapHomePage> {
  String? userRole; // Role can be 'member' or 'club_head'
  int _selectedIndex = 0; // For BottomNavigationBar
  final _eventTitleController = TextEditingController();
  final _eventDescriptionController = TextEditingController();
  final _announcementTitleController = TextEditingController();
  final _announcementDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserRole();
  }

  // Fetch user role from Firestore
  Future<void> _fetchUserRole() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          userRole = userDoc['role']; // Fetching 'role' field
        });
      }
    } catch (e) {
      print("Error fetching user role: $e");
    }
  }

  // Explore bands data
  final List<Map<String, String>> bands = [
    {
      'image': 'images/daastan.png',
      'name': 'Daastan',
      'description':
          'Bollywood/Hindi pop-A popular band of RVCE known for their energetic performances participating in many colleges like IIT Bombay and IIT Madras and winning almost everywhere.',
    },
    {
      'image': 'images/ameya.jpg',
      'name': 'Ameya',
      'description':
          'Ameya is a classical fusion band of RVCE, blending the timeless beauty of classical music with modern genres to create a unique sound.',
    },
    {
      'image': 'images/take.png',
      'name': 'Take 1.62',
      'description':
          'Blending classical melodies with modern sounds, this band creates a unique musical journey that transcends genres.',
    },
  ];

  // Gallery images
  final List<String> galleryImages = [
    'images/alaapgal1.png',
    'images/alaapgal2.png',
    'images/alaapgal3.jpg',
    'images/alaapgal4.jpg',
  ];

  // Home Page Content
  Widget _buildHomeContent() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('events').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var events = snapshot.data!.docs;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'images/alaap.png',
                    height: 150,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "About Alaap",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Alaap Music Club brings together music enthusiasts from all corners. Join us to explore, create, and share the joy of music.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                if (userRole == 'Club Head') ...[
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Add Event"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _eventTitleController,
                                  decoration:
                                      InputDecoration(labelText: "Event Title"),
                                ),
                                TextField(
                                  controller: _eventDescriptionController,
                                  decoration: InputDecoration(
                                      labelText: "Event Description"),
                                  maxLines: 3,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('events')
                                      .add({
                                    'title': _eventTitleController.text,
                                    'description':
                                        _eventDescriptionController.text,
                                    'timestamp': Timestamp.now(),
                                  });
                                  _eventTitleController.clear();
                                  _eventDescriptionController.clear();
                                  Navigator.pop(context);
                                },
                                child: Text("Add"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                    child: Text("Add Event"),
                  ),
                ],
                SizedBox(height: 20),
                Text(
                  "Upcoming Events",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    var event = events[index];
                    return Card(
                      color: const Color.fromARGB(255, 33, 33, 33),
                      child: ListTile(
                        title: Text(event['title'],
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(event['description'],
                            style: TextStyle(color: Colors.white70)),
                        trailing: userRole == 'Club Head'
                            ? IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('events')
                                      .doc(event.id)
                                      .delete();
                                },
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Explore Bands Content
  Widget _buildExploreBandsContent() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: bands.length,
      itemBuilder: (context, index) {
        final band = bands[index];
        return Card(
          color: Colors.grey[900],
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(band['image']!, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  band['name']!,
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  band['description']!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Gallery Page Content
  Widget _buildGalleryContent() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: galleryImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            galleryImages[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  // Announcements Page Content
  Widget _buildAnnouncementsContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userRole == 'Club Head') ...[
            Text(
              "Add Announcement",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _announcementTitleController,
              decoration: InputDecoration(
                labelText: "Title",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _announcementDescriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('announcements')
                    .add({
                  'title': _announcementTitleController.text,
                  'description': _announcementDescriptionController.text,
                  'timestamp': Timestamp.now(),
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Announcement added successfully!")),
                );
                _announcementTitleController.clear();
                _announcementDescriptionController.clear();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              child: Text("Add Announcement"),
            ),
          ],
          SizedBox(height: 20),
          Text(
            "Announcements",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('announcements')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              var announcements = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  var announcement = announcements[index];
                  return Card(
                    color: Colors.grey[900],
                    child: ListTile(
                      title: Text(
                        announcement['title'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        announcement['description'],
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: userRole == 'Club Head'
                          ? IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('announcements')
                                    .doc(announcement.id)
                                    .delete();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Announcement deleted")),
                                );
                              },
                            )
                          : null,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildAnnouncementsContent() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         if (userRole == 'Club Head') ...[
  //           Text(
  //             "Add Announcement",
  //             style: TextStyle(
  //               color: Colors.purple,
  //               fontSize: 24,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           TextField(
  //             controller: _announcementTitleController,
  //             decoration: InputDecoration(
  //               labelText: "Title",
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.purple),
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           TextField(
  //             controller: _announcementDescriptionController,
  //             decoration: InputDecoration(
  //               labelText: "Description",
  //               enabledBorder: OutlineInputBorder(
  //                 borderSide: BorderSide(color: Colors.purple),
  //               ),
  //             ),
  //             maxLines: 3,
  //           ),
  //           SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: () async {
  //               await FirebaseFirestore.instance
  //                   .collection('announcements')
  //                   .add({
  //                 'title': _announcementTitleController.text,
  //                 'description': _announcementDescriptionController.text,
  //                 'timestamp': Timestamp.now(),
  //               });
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(content: Text("Announcement added successfully!")),
  //               );
  //               _announcementTitleController.clear();
  //               _announcementDescriptionController.clear();
  //             },
  //             style: ElevatedButton.styleFrom(
  //               foregroundColor: Colors.purple,
  //             ),
  //             child: Text("Add Announcement"),
  //           ),
  //         ],
  //         SizedBox(height: 20),
  //         Text(
  //           "Announcements",
  //           style: TextStyle(
  //             color: Colors.purple,
  //             fontSize: 24,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         StreamBuilder<QuerySnapshot>(
  //           stream: FirebaseFirestore.instance
  //               .collection('announcements')
  //               .orderBy('timestamp', descending: true)
  //               .snapshots(),
  //           builder: (context, snapshot) {
  //             if (!snapshot.hasData) {
  //               return Center(child: CircularProgressIndicator());
  //             }
  //             var announcements = snapshot.data!.docs;
  //             return ListView.builder(
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemCount: announcements.length,
  //               itemBuilder: (context, index) {
  //                 var announcement = announcements[index];
  //                 return Card(
  //                   color: Colors.grey[900],
  //                   child: ListTile(
  //                     title: Text(announcement['title'],
  //                         style: TextStyle(color: Colors.white)),
  //                     subtitle: Text(announcement['description'],
  //                         style: TextStyle(color: Colors.white70)),
  //                   ),
  //                 );
  //               },
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Bottom Navigation Bar content
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.purple,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Explore Bands',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: 'Gallery',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.announcement),
          label: 'Announcements',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alaap Music Club"),
        backgroundColor: Colors.purple,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          _buildExploreBandsContent(),
          _buildGalleryContent(),
          _buildAnnouncementsContent(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
