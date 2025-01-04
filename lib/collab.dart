import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(ClubManagementApp());
}

class ClubManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 122, 25, 144),
        ),
      ),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  List<Map<String, String>> incomingRequests = [
    {
      'clubName': 'CARV',
      'eventName': '8th mile- need vocalists from Alaap for the play',
      'dateTime': 'Jan 15, 2025, 3:00 PM'
    },
    {
      'clubName': 'Coding Club',
      'eventName': 'Hackathon volunteers from ACM',
      'dateTime': 'Jan 20, 2025, 9:00 AM'
    },
  ];

  List<Map<String, String>> outgoingRequests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? CollaborationPage(
              onRequestSent: (clubName, eventName, dateTime) {
                setState(() {
                  outgoingRequests.add({
                    'clubName': clubName,
                    'eventName': eventName,
                    'dateTime': dateTime,
                  });
                });
              },
            )
          : InboxPage(
              incomingRequests: incomingRequests,
              outgoingRequests: outgoingRequests,
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: const Color.fromARGB(255, 122, 25, 144),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Collaborate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
        ],
      ),
    );
  }
}

class CollaborationPage extends StatefulWidget {
  final Function(String, String, String) onRequestSent;

  CollaborationPage({required this.onRequestSent});

  @override
  _CollaborationPageState createState() => _CollaborationPageState();
}

class _CollaborationPageState extends State<CollaborationPage> {
  void _showRequestDialog(BuildContext context, String clubName) async {
    final TextEditingController eventNameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    DateTime selectedDateTime = DateTime.now();

    // Function to select date and time
    Future<void> _selectDateTime() async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(selectedDateTime),
        );
        if (pickedTime != null) {
          setState(() {
            selectedDateTime = DateTime(pickedDate.year, pickedDate.month,
                pickedDate.day, pickedTime.hour, pickedTime.minute);
          });
        }
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text('Send Request to $clubName',
              style: TextStyle(color: Colors.white)),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: eventNameController,
                  decoration: InputDecoration(
                    labelText: 'Event Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Event Description',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: _selectDateTime,
                  child: Text('Select Date and Time'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                String formattedDateTime =
                    DateFormat('MMM d, yyyy, h:mm a').format(selectedDateTime);
                widget.onRequestSent(
                    clubName, eventNameController.text, formattedDateTime);
                Navigator.of(context).pop();
              },
              style:
                  ElevatedButton.styleFrom(foregroundColor: Colors.deepPurple),
              child: Text('Send Request'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final clubs = [
      {'name': 'Alaap', 'image': 'images/alaap[1].png'},
      {'name': 'CARV', 'image': 'images/carv.png'},
      {'name': 'Astra', 'image': 'images/astra.png'},
      {'name': 'Dhruva', 'image': 'images/dhruva.png'},
      {'name': 'Coding Club', 'image': 'images/cc.png'},
      {'name': 'NSS', 'image': 'images/nss.png'},
      {'name': 'E-cell', 'image': 'images/ecell.png'},
      {'name': 'Helios', 'image': 'images/helios.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Collaborate with Clubs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Search clubs',
                prefixIcon: Icon(Icons.search, color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: clubs.length,
                itemBuilder: (context, index) {
                  final club = clubs[index];
                  return Card(
                    color: Colors.grey[850],
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: SizedBox(
                        child:
                            Image.asset(club['image']!, width: 10, height: 10),
                        height: 40,
                        width: 40,
                      ), // Add small image
                      title: Text(club['name']!,
                          style: TextStyle(color: Colors.white)),
                      trailing: ElevatedButton(
                        onPressed: () =>
                            _showRequestDialog(context, club['name']!),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.deepPurple),
                        child: Text('Send Request'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InboxPage extends StatefulWidget {
  final List<Map<String, String>> incomingRequests;
  final List<Map<String, String>> outgoingRequests;

  InboxPage({required this.incomingRequests, required this.outgoingRequests});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Incoming Requests Section
            Text('Incoming Requests',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.incomingRequests.length,
                itemBuilder: (context, index) {
                  final request = widget.incomingRequests[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[850], // Light purple background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(request['clubName']!,
                          style: TextStyle(
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${request['eventName']} – ${request['dateTime']}',
                          style: TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),

            // Divider
            Divider(color: Colors.grey, thickness: 2.0),

            // Outgoing Requests Section
            Text('Outgoing Requests',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: widget.outgoingRequests.length,
                itemBuilder: (context, index) {
                  final request = widget.outgoingRequests[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[850], // Light purple background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(request['clubName']!,
                          style: TextStyle(
                              color: Colors.purple[300],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${request['eventName']} – ${request['dateTime']}',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
