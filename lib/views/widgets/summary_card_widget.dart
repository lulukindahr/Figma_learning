import 'package:flutter/material.dart';

class SummaryCardWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const SummaryCardWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42, // Lebar card
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Default ke kiri untuk ikon
        children: [
          // Ikon di kiri atas
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          SizedBox(height: 12),
          // Teks utama (angka dan nilai) rata kanan
          Align(
            alignment: Alignment.centerRight, // Hanya teks ini yang rata kanan
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4),
          // Label teks di bawahnya rata kanan
          Align(
            alignment: Alignment.centerRight, // Hanya teks ini yang rata kanan
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
