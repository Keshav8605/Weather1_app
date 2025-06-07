import 'dart:async';
import 'colors_.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'weather_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final controller = Get.find<WeatherController>();

final data = controller.weatherData;
final daysdata = data['days'];

String getDayFromEpoch(int epoch) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  return DateFormat('EEEE').format(date);
}

class Windspeed_chart extends StatefulWidget {
  Windspeed_chart({super.key});

  List<Color> get availableColors => const <Color>[
        Appcolors.contentColorPurple,
        Appcolors.contentColorYellow,
        Appcolors.contentColorBlue,
        Appcolors.contentColorOrange,
        Appcolors.contentColorPink,
        Appcolors.contentColorRed,
      ];

  final Color barBackgroundColor = Colors.white.withOpacity(0.1);
  final Color barColor = Appcolors.contentColorWhite;
  final Color touchedBarColor = Appcolors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => Windspeed_barchart();
}

class Windspeed_barchart extends State<Windspeed_chart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  late double size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width * 0.95;
    double barWidth = size / 30;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: size / 35),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size / 50),
              child: BarChart(
                mainBarData(barWidth),
              ),
            ),
          ),
          SizedBox(height: size / 25),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    required double width,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;

    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? (y + 3 > 100 ? 100 : y + 3) : y,
          color: isTouched ? const Color(0xff0049C6) : Colors.lightBlueAccent,
          width: isTouched ? width * 1.2 : width,
          borderSide: isTouched
              ? BorderSide(color: const Color(0xff0049C6))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100, // Use maxY instead of size-based value
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(double barWidth) =>
      List.generate(7, (i) {
        final windSpeeds = [
          daysdata[0]['windspeed'].toDouble(),
          daysdata[1]['windspeed'].toDouble(),
          daysdata[2]['windspeed'].toDouble(),
          daysdata[3]['windspeed'].toDouble(),
          daysdata[4]['windspeed'].toDouble(),
          daysdata[5]['windspeed'].toDouble(),
          daysdata[6]['windspeed'].toDouble(),
        ];
        return makeGroupData(i, windSpeeds[i],
            isTouched: i == touchedIndex, width: barWidth);
      });

  BarChartData mainBarData(double barWidth) {
    return BarChartData(
      maxY: 100,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => const Color(0xff010D32),
          tooltipBorderRadius: BorderRadius.circular(size / 35),
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: size / 35,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final weekDays = [
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday',
              'Sunday',
            ];
            final weekDay = weekDays[group.x];

            return BarTooltipItem(
              '$weekDay\n',
              TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: size / 25,
                fontFamily: 'Montserrat',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${(rod.toY - 1).toStringAsFixed(1)} km/hr',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size / 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: size / 10,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: (value, meta) {
              return Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: size / 300,
                    width: size / 50,
                  ),
                  SizedBox(width: size / 150),
                  Text(
                    '${value.toInt()}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size / 35,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              );
            },
            reservedSize: size / 10, // Reduced from size / 15 to avoid overflow
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: showingGroups(barWidth),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
      fontFamily: 'Montserrat',
      fontSize: size / 35,
    );

    final weekAbbr = [
      getDayFromEpoch(daysdata[0]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[1]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[2]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[3]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[4]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[5]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
      getDayFromEpoch(daysdata[6]['datetimeEpoch'].toInt())
          .toString()
          .substring(0, 3)
          .toUpperCase(),
    ];

    String label = (value.toInt() >= 0 && value.toInt() < weekAbbr.length)
        ? weekAbbr[value.toInt()]
        : '';

    return SideTitleWidget(
      meta: meta,
      space: size / 35,
      child: Text(label, style: style),
    );
  }
}
