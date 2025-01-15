import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jackelieson/constant/text_font_style.dart';
import 'package:jackelieson/gen/colors.gen.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 40,
                  barGroups: [
                    _buildBarGroup(0, 15, 'Jan 24'),
                    _buildBarGroup(1, 20, 'Feb 24'),
                    _buildBarGroup(2, 22, 'Mar 24'),
                    _buildBarGroup(3, 18, 'Apr 24'),
                    _buildBarGroup(4, 28, 'May 24'),
                    _buildBarGroup(5, 22, 'Jun 24', isProjected: true),
                  ],
                  gridData: FlGridData(
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    // show: false,
                  ),
                  borderData: FlBorderData(
                      show: true,
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: AppColors.c686868))),
                  titlesData: FlTitlesData(
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final labels = [
                            'Jan 24',
                            'Feb 24',
                            'Mar 24',
                            'Apr 24',
                            'May 24',
                            'Jun 24'
                          ];
                          return Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              labels[value.toInt()],
                              style: TextFontStyle
                                  .headline16w500cFEFFFFStyleRoboto
                                  .copyWith(
                                      color: AppColors.c686868,
                                      fontSize: 10.sp),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      // tooltipBorder: BorderSide(
                      //     color: AppColors.c686868,
                      //     style: BorderStyle.solid,
                      //     width: 4),

                      // tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY.toInt()} days',
                          TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20.w,
                height: 20.h,
                decoration: ShapeDecoration(
                  color: Color(0xFF0070F0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const SizedBox(width: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Best streak:',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                                color: AppColors.c686868, fontSize: 14.sp)),
                    TextSpan(
                        text: ' 30 days Nov 23',
                        style: TextFontStyle.headline14w400cFEFFFFStyleRoboto
                            .copyWith(
                                color: AppColors.allPrimaryColor,
                                fontSize: 14.sp)),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y, String label,
      {bool isProjected = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isProjected ? Colors.blue.withOpacity(0.3) : Colors.blue,
          width: 12,
          backDrawRodData: BackgroundBarChartRodData(
            show: isProjected,
            toY: 30, // Faded bar for projection
            color: Colors.blue.withOpacity(0.15),
          ),
        ),
      ],
    );
  }
}
