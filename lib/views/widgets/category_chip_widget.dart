import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900], // Warna latar belakang untuk kontras
      body: Center( // Pastikan widget berada di tengah untuk melihat hasilnya
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Hanya chip kategori yang ditampilkan tanpa ikon filter
              CategoryChipWidget(
                label: 'Design',
                count: 10,
                isSelected: true,
                onTap: () {
                  // Logic saat chip Design ditekan
                  print('Design chip clicked');
                },
              ),
              SizedBox(width: 8),
              CategoryChipWidget(
                label: 'Programming',
                count: 24,
                onTap: () {
                  // Logic saat chip Programming ditekan
                  print('Programming chip clicked');
                },
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}

class CategoryChipWidget extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback? onTap; // Callback saat chip ditekan

  const CategoryChipWidget({
    Key? key,
    required this.label,
    required this.count,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[800], // Warna jika dipilih
          borderRadius: BorderRadius.circular(20), // Membentuk chip
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white, // Latar belakang bulatan putih
                shape: BoxShape.circle,
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey[800], // Warna angka
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
