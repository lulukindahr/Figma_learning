import 'package:flutter/material.dart';
import 'views/screens/course_list_screen.dart'; // Impor CourseListScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseListScreen(), // Pastikan ini adalah halaman yang ditampilkan
    );
  }
}
