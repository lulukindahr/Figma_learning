import 'package:flutter/material.dart';
import '../widgets/summary_card_widget.dart';
import '../widgets/lesson_item_widget.dart';
import '../widgets/floating_bottom_bar.dart';
import 'learning_statistic_screen.dart'; // Pastikan path ini benar

class FigmaCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/authorbl.png'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Figma design app',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Tombol "On progress" dengan fungsi navigasi
                      InkWell(
                        onTap: () {
                          // Navigasi ke halaman LearningStatisticScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearningStatisticScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'On progress',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    'By Mbak Puput',
                    style: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                  SizedBox(height: 24),

                  // Row for Summary Cards with icon color customization
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SummaryCardWidget(
                        icon: Icons.access_time,
                        iconColor: Colors.yellow, // Warna kuning untuk ikon jam
                        value: '1,5 Hours',
                        label: 'Total Classed Watched',
                      ),
                      SummaryCardWidget(
                        icon: Icons.library_books,
                        iconColor: Colors.black, // Warna hitam untuk ikon pelajaran
                        value: '10 Lessons',
                        label: 'Total Submission this Course',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),

                  // Lesson List Items
                  LessonItemWidget(
                    title: 'How to create simple wireframes',
                    duration: '12 minutes',
                    status: 'On progress',
                  ),
                  SizedBox(height: 16),
                  LessonItemWidget(
                    title: 'How to design apps and websites',
                    duration: '12 minutes',
                    status: 'Not started',
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),

          // Floating Bottom Bar di bagian paling bawah layar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FloatingBottomBar(),
          ),
        ],
      ),
    );
  }
}
