import 'package:flutter/material.dart';
import '../screens/figma_course_screen.dart'; // Import FigmaCourseScreen

class CourseCardWidget extends StatelessWidget {
  final String title;
  final String mentor;
  final String imagePath;
  final bool isLocked;

  const CourseCardWidget({
    Key? key,
    required this.title,
    required this.mentor,
    required this.imagePath,
    this.isLocked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 250, // Sesuaikan tinggi agar sesuai dengan desain
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.5), // Overlay untuk visibilitas teks
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bagian Atas Kartu (Title dan Subtitle)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              mentor,
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border, color: Colors.white),
                              onPressed: () {
                                // Logic untuk menandai sebagai favorit
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.bookmark_border, color: Colors.white),
                              onPressed: () {
                                // Logic untuk menyimpan kursus
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Button di Tengah Kartu
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (title == "Figma Design app") {
                      // Navigasi ke FigmaCourseScreen hanya jika judul adalah "Figma Design app"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FigmaCourseScreen()),
                      );
                    } else {
                      // Menampilkan SnackBar jika kursus terkunci
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Course Locked"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna latar belakang tombol
                    foregroundColor: Colors.black, // Warna teks tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Design course'),
                ),
              ),
              // Ikon Kunci di Bawah Kiri dengan Panah dan Ikon Buka Kunci
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.lock_open,
                      color: Colors.white,
                      size: 24,
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
}
