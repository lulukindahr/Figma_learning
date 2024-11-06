import 'package:flutter/material.dart';

class NavbarScreen extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showNotificationDot;
  final VoidCallback? onProfileTap;

  NavbarScreen({
    this.title,
    this.showNotificationDot = false,
    this.onProfileTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.0); // Atur tinggi AppBar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title != null
          ? Text(
        title!,
        style: TextStyle(color: Colors.white),
      )
          : null, // Tampilkan judul jika ada
      leading: IconButton(
        icon: Icon(
          Icons.adjust, // Ikon kiri
          color: Colors.white,
        ),
        onPressed: () {
          // Logic saat ikon kiri ditekan
          print('Left icon clicked');
        },
      ),
      actions: [
        // Ikon kalender
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                // Logic saat ikon kalender ditekan
                print('Calendar icon clicked');
              },
            ),
          ),
        ),
        // Ikon lonceng dengan dot pemberitahuan
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[800],
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    // Logic saat ikon lonceng ditekan
                    print('Notification icon clicked');
                  },
                ),
              ),
              if (showNotificationDot) // Tampilkan dot hanya jika showNotificationDot true
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red, // Warna dot pemberitahuan
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
        // Ikon profil
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('lib/assets/authorbl.png'), // Gambar profil dummy
            ),
          ),
        ),
      ],
    );
  }
}
