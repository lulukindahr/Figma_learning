import 'package:flutter/material.dart';
import '../screens/course_list_screen.dart'; // Pastikan ini adalah path yang benar ke CourseListScreen
import '../screens/learning_statistic_screen.dart'; // Pastikan ini adalah path yang benar ke LearningStatisticScreen

class FloatingBottomBar extends StatefulWidget {
  @override
  _FloatingBottomBarState createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  int _selectedIndex = 0; // Indeks ikon yang dipilih

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Logika navigasi berdasarkan ikon yang dipilih
    if (index == 0) {
      // Jika ikon Home ditekan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CourseListScreen()),
      );
    } else if (index == 2) {
      // Jika ikon Statistik ditekan
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LearningStatisticScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250, // Menentukan lebar container sesuai kapasitas ikon
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5), // Background transparan 50%
          borderRadius: BorderRadius.circular(30), // Membentuk oval untuk tampilan melengkung
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Posisi ikon dengan jarak rapat
          children: [
            // Icon Home
            _buildIcon(Icons.home, 0),
            // Icon Search
            _buildIcon(Icons.search, 1),
            // Icon Statistic
            _buildIcon(Icons.bar_chart, 2),
            // Icon Profile
            _buildIcon(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? Colors.white // Warna putih saat dipilih
            : Colors.white.withOpacity(0.6), // Transparan dengan opacity 60% saat tidak dipilih
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: _selectedIndex == index ? Colors.greenAccent : Colors.black, // Warna berubah saat dipilih
        ),
        onPressed: () {
          _onIconTapped(index);
        },
      ),
    );
  }
}
