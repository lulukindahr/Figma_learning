import 'package:flutter/material.dart';
import '../screens/navbar_screen.dart'; // Import NavbarScreen
import '../widgets/course_card_widget.dart';
import '../widgets/category_chip_widget.dart';
import '../widgets/floating_bottom_bar.dart'; // Import FloatingBottomBar

class CourseListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courseList = [
    {
      'title': 'Figma Design app',
      'mentor': 'By Mbak Puput',
      'imagePath': 'lib/assets/figma.png',
      'isLocked': true,
    },
    {
      'title': 'Webflow Fundamental',
      'mentor': 'By Mas Wachid',
      'imagePath': 'lib/assets/webflow.jpg',
      'isLocked': true,
    },
    {
      'title': 'Adobe XD Basics',
      'mentor': 'By Pak Rahmat',
      'imagePath': 'lib/assets/adobe.png',
      'isLocked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Warna latar belakang sesuai desain
      appBar: NavbarScreen(), // Gunakan NavbarScreen sebagai AppBar
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your course',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    // Chip dengan ikon filter yang dapat diklik
                    InkWell(
                      onTap: () {
                        // Logic saat ikon filter ditekan
                        print('Filter chip clicked');
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_list,
                              color: Colors.white,
                              size: 22,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    // CategoryChipWidget yang dapat ditekan
                    InkWell(
                      onTap: () {
                        // Logic saat chip Design ditekan
                        print('Design chip clicked');
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: CategoryChipWidget(label: 'Design', count: 10),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        // Logic saat chip Programming ditekan
                        print('Programming chip clicked');
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: CategoryChipWidget(label: 'Programming', count: 24),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: courseList.length,
                  itemBuilder: (context, index) {
                    final course = courseList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: CourseCardWidget(
                        title: course['title'],
                        mentor: course['mentor'],
                        imagePath: course['imagePath'],
                        isLocked: course['isLocked'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Jarak dari bawah agar melayang
            left: 30, // Jarak dari kiri
            right: 30, // Jarak dari kanan
            child: FloatingBottomBar(), // Menambahkan FloatingBottomBar
          ),
        ],
      ),
    );
  }
}
