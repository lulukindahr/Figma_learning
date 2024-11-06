import 'package:flutter/material.dart';
import '../widgets/floating_bottom_bar.dart';
import 'course_list_screen.dart';
import 'learning_statistic_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Main Screen',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.greenAccent,
          tabs: [
            Tab(icon: Icon(Icons.list), text: 'Courses'),
            Tab(icon: Icon(Icons.show_chart), text: 'Statistics'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CourseListScreen(), // Menampilkan daftar kursus
          LearningStatisticScreen(), // Menampilkan statistik pembelajaran
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingBottomBar(),
      ),
    );
  }
}
