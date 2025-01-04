import 'package:flutter/material.dart';
import 'carv.dart';
import 'astra.dart';
import 'nss.dart';
import 'helios.dart';
import 'alaap.dart';
import 'ecell.dart';
import 'dhruva.dart';
import 'cc.dart';
import 'newastra.dart';

void main() {
  runApp(ClubHubApp());
}

class ClubHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color(0xFF1F1F2E), // Dark background color
      ),
      home: ClubsPage(),
    );
  }
}

class ClubsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clubs'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Search for clubs...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.black45,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Tech Clubs Section
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'Tech Clubs',
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18.0,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // GridView.count(
            //   shrinkWrap: true,
            //   padding: const EdgeInsets.all(16.0),
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 16.0,
            //   mainAxisSpacing: 16.0,
            //   children: [
            //     buildClubCard(
            //       context,
            //       'Helios',
            //       'images/helio2.png', // Example image
            //       heliopage(),
            //       ' ',
            //     ),
            //     buildClubCard(
            //       context,
            //       'Coding Club',
            //       'images/cc.png', // Example image
            //       CodingClubApp(),
            //       ' ',
            //     ),
            //     buildClubCard(
            //       context,
            //       'Astra Robotics',
            //       'images/astra.png', // Example image
            //       astrapage(),
            //       ' ',
            //     ),
            //     buildClubCard(
            //       context,
            //       'Dhruva',
            //       'images/dhruva.png', // Example image
            //       DhruvaClubApp(),
            //       ' ',
            //     ),
            //   ],
            // ),

            // Non-Tech Clubs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Non-Tech Clubs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                buildClubCard(
                  context,
                  'Alaap',
                  'images/alaap[1].png', // Example image
                  AlaapHomePage(),
                  'Music Club',
                ),

                buildClubCard(
                  context,
                  'CARV - Theatre Club',
                  'images/carvbanner.png',
                  CarvTheatreApp(),
                  'Theatre Club',
                ), // Pass CarvPage to Theatre Club
                buildClubCard(
                  context,
                  'NSS',
                  'images/nss.png',
                  NSSClubApp(),
                  'National Service Society',
                ),
                // buildClubCard(
                //   context,
                //   'Alaap',
                //   'images/alaap[1].png', // Example image
                //   AlaapHomePage(),
                //   'Music Club',
                // ),
                buildClubCard(
                  context,
                  'ecell',
                  'images/ecell.png', // Example image
                  ECellClubApp(),
                  'Entrepreneurship Cell',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tech Clubs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                buildClubCard(
                  context,
                  'Helios',
                  'images/helio2.png', // Example image
                  heliopage(),
                  ' ',
                ),
                buildClubCard(
                  context,
                  'Coding Club',
                  'images/cc.png', // Example image
                  CodingClubApp(),
                  ' ',
                ),
                buildClubCard(
                  context,
                  'Astra Robotics',
                  'images/astra.png', // Example image
                  astrapage(),
                  ' ',
                ),
                buildClubCard(
                  context,
                  'Dhruva',
                  'images/dhruva.png', // Example image
                  DhruvaClubApp(),
                  ' ',
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.0),
                  IconButton(
                    icon: Icon(Icons.link),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  SizedBox(width: 16.0),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Text(
              '© 2023 ClubVerse. All rights reserved. | About Us | Contact Us',
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClubCard(BuildContext context, String title, String imagePath,
      Widget nextPage, String descc) {
    return InkWell(
      onTap: nextPage != null
          ? () {
              // Navigate to the next page when the card is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nextPage),
              );
            }
          : null, // Only enable tap if a page is provided
      child: Card(
        color: Color(0xFF2A2A3D), // Dark card color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                descc,
                style: TextStyle(color: Colors.white54, fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
