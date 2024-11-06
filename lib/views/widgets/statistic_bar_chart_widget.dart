import 'package:flutter/material.dart';

class StatisticBarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Focus learned statistic',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'avg 3 Hours per day',
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(5, (index) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: index == 2 ? 80 : 50, // Tinggi batang tergantung data
                        decoration: BoxDecoration(
                          color: index == 2 ? Colors.yellow : Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      if (index == 2) // Menambahkan label di atas batang yang dipilih
                        Positioned(
                          top: -20,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '2 Hours',
                              style: TextStyle(color: Colors.black, fontSize: 10),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    ['Sun', 'Mon', 'Tue', 'Wed', 'Thu'][index],
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
