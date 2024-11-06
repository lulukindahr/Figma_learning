import 'package:flutter/material.dart';
import '../widgets/statistic_bar_chart_widget.dart';
import '../widgets/statistic_card_widget.dart';
import '../widgets/mentor_card_widget.dart';
import '../widgets/floating_bottom_bar.dart';

class LearningStatisticScreen extends StatelessWidget {
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
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
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
                  Text(
                    'Learning statistic overview',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'This week',
                    style: TextStyle(color: Colors.grey[400], fontSize: 16),
                  ),
                  SizedBox(height: 24),

                  // Bar Chart
                  StatisticBarChartWidget(),
                  SizedBox(height: 24),

                  // Row for Total Classed Watched and Favorite Mentor
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: StatisticCardWidget(
                          icon: Icons.access_time,
                          value: '2,5 Hours',
                          label: 'Total Classed Watched',
                        ),
                      ),
                      SizedBox(width: 16), // Jarak antar card
                      Expanded(
                        child: MentorCardWidget(
                          name: 'Mbak Puput',
                          classes: '4 class',
                          backgroundImage: 'lib/assets/bcg.jpg', // Gambar background untuk card
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 80), // Spacing for the floating bottom bar
                ],
              ),
            ),
          ),

          // Floating Bottom Bar
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
