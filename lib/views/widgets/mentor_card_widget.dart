import 'package:flutter/material.dart';

class MentorCardWidget extends StatelessWidget {
  final String name;
  final String classes;
  final String backgroundImage; // Gambar background

  const MentorCardWidget({
    Key? key,
    required this.name,
    required this.classes,
    required this.backgroundImage, // Gambar background
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Mengisi seluruh lebar yang diberikan oleh parent
      height: 120, // Sesuaikan tinggi dengan card sebelahnya
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(backgroundImage), // Gambar background dari aset
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2), // Efek overlay gelap pada background
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Menempatkan teks di bawah
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Nama Mentor
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          // Jumlah Kelas
          Text(
            classes,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
