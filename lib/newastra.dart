import 'package:flutter/material.dart';
import 'testt.dart';

void main() {
  runApp(astrapage());
}


class astrapage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClubPageTemplate(
      headerImage: 'images/astra.png',  // Path to the header image
      clubName: 'astra Club',
      section1: 'Our Verticals',
      section2: 'Upcoming Events',
      //section3: 'Achievements',
      clr: const Color.fromARGB(255, 46, 23, 112),
      desc1: 'hello this is description',
      desc2:'hey this is description2',
      verticals: [
        {
          'title': 'Development',
          'description': 'Focuses on building software and apps.',
          'imagePath': 'images/heliobanner.png',
        },
        {
          'title': 'Design',
          'description': 'Works on UX/UI for apps and websites.',
          'imagePath': 'images/helio2.png',
        },
      ],
      projects: [
        {
          'title': 'Club Management App',
          'description': 'App to manage all club activities.',
          'imagePath': 'assets/club_app.jpg',
        },
        {
          'title': 'Tech Fest Website',
          'description': 'Website for our annual tech fest.',
          'imagePath': 'assets/tech_fest.jpg',
        },
      ],
      // memberSpotlight: [
      //   {
      //     'title': 'John Doe',
      //     'description': 'Lead Developer, AI Team.',
      //     'imagePath': 'assets/member_john.jpg',
      //   },
      //   {
      //     'title': 'Jane Smith',
      //     'description': 'Design Lead, UX/UI Team.',
      //     'imagePath': 'assets/member_jane.jpg',
      //   },
      // ],
      photoGallery: ['images/gallery1.png',
        'images/gallery2.png',
        'images/gallery3.png',
        'images/gallery4.png',
        'images/gallery4.png',
        'images/gallery4.png',
        ],
      
    );
  }
}

