import 'package:flutter/material.dart';
import 'testt.dart';

void main() {
  runApp(heliopage());
}

class heliopage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClubPageTemplate(
      headerImage: 'images/helios.png', // Path to the header image
      clubName: 'Helios',
      section1: 'Our Verticals',
      section2: 'Projects',
      //section3: 'Achievements',
      clr: const Color.fromARGB(255, 167, 90, 12),
      desc1:
          'Helios is a mechanical engineering club specializing in vehicle systems and drivetrain technologies. The club provides a platform for students passionate about designing, building, and optimizing mechanical systems for vehicles ',
      desc2:
          'Helios is a student-driven mechanical engineering club that specializes in vehicle systems and drivetrain technologies. Our mission is to foster innovation and technical expertise by engaging in hands-on projects, workshops, and competitions. ',
      verticals: [
        {
          'title': 'Development',
          'description': 'Develops drive terrain supported mechanics',
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
          'title': 'CAD  ',
          'description': 'Develops prototype of chassis',
          'imagePath': 'images/helio3.jpg',
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
      photoGallery: [
        'images/heliogallery1.jpg',
        'images/heliogallery2.jpg',
        'images/heliogallery3.jpg',
      ],
    );
  }
}
