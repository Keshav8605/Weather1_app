import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'colors_.dart';

class UvIndexChartWidget extends StatefulWidget {
  final Color? gradientColor1;
  final Color? gradientColor2;
  final Color? gradientColor3;
  final Color? indicatorStrokeColor;

  const UvIndexChartWidget({
    Key? key,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientColor3,
    this.indicatorStrokeColor,
  }) : super(key: key);

  @override
  _UvIndexChartWidgetState createState() => _UvIndexChartWidgetState();
}

class _UvIndexChartWidgetState extends State<UvIndexChartWidget> {
  final List<FlSpot> allSpots = const [
    FlSpot(0, 1),
    FlSpot(1, 2),
    FlSpot(2, 5),
    FlSpot(3, 3),
    FlSpot(4, 4),
    FlSpot(5, 4),
    FlSpot(6, 11),
  ];

  List<int> showingTooltipOnSpots = [];

  void toggleSpot(int index) {
    setState(() {
      if (showingTooltipOnSpots.contains(index)) {
        showingTooltipOnSpots.remove(index);
      } else {
        showingTooltipOnSpots.add(index);
      }
    });
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final style = TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      decoration: TextDecoration.none,
      fontFamily: 'Montserrat',
      fontSize: 18 * chartWidth / 500,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'MON';
        break;
      case 1:
        text = 'TUE';
        break;
      case 2:
        text = 'WED';
        break;
      case 3:
        text = 'THU';
        break;
      case 4:
        text = 'FRI';
        break;
      case 5:
        text = 'SAT';
        break;
      case 6:
        text = 'SUN';
        break;
      default:
        return Container();
    }
    return SideTitleWidget(meta: meta, child: Text(text, style: style));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.95;
    final g1 = widget.gradientColor1 ?? Appcolors.contentColorBlue;
    final g2 = widget.gradientColor2 ?? Appcolors.contentColorPink;
    final g3 = widget.gradientColor3 ?? Appcolors.contentColorRed;
    final strokeColor = widget.indicatorStrokeColor ?? Appcolors.mainTextColor1;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: true,
        barWidth: size / 130,
        shadow: const Shadow(blurRadius: 20),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              g1.withOpacity(0.2),
              g2.withOpacity(0.2),
              g3.withOpacity(0.2),
            ],
          ),
        ),
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: size / 50,
            color: Appcolors.contentColorPink,
          ),
        ),
        gradient: LinearGradient(
          colors: [g1, g2, g3],
          stops: const [0.1, 0.4, 0.9],
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return LineChart(
            LineChartData(
              borderData: FlBorderData(
                show: false,
              ),
              showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                return ShowingTooltipIndicators([
                  LineBarSpot(
                      tooltipsOnBar,
                      lineBarsData.indexOf(tooltipsOnBar),
                      tooltipsOnBar.spots[index]),
                ]);
              }).toList(),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) return;
                  if (event is FlTapUpEvent) {
                    final spotIndex = response.lineBarSpots!.first.spotIndex;
                    toggleSpot(spotIndex);
                  }
                },
                mouseCursorResolver:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null)
                    return SystemMouseCursors.basic;
                  return SystemMouseCursors.click;
                },
                getTouchedSpotIndicator: (barData, indexes) {
                  return indexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(color: Colors.pink),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: size / 50,
                          color: lerpGradient(barData.gradient!.colors,
                              barData.gradient!.stops!, percent / 100),
                          strokeWidth: 2,
                          strokeColor: strokeColor,
                        ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (_) => Colors.transparent,
                  tooltipBorderRadius: BorderRadius.circular(size / 35),
                  getTooltipItems: (spots) => spots.map((spot) {
                    return LineTooltipItem(
                      spot.y.toString(),
                      TextStyle(
                        color: Colors.white,
                        fontSize: size / 15,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.none,
                      ),
                    );
                  }).toList(),
                ),
              ),
              lineBarsData: lineBarsData,
              minY: 0,
              maxY: 12,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    reservedSize: size / 8,
                    getTitlesWidget: (value, meta) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size / 50,
                            height: size / 300,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: const BoxDecoration(
                              color: Appcolors.contentColorPink,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          Text(
                            value.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return bottomTitleWidgets(
                          value, meta, constraints.maxWidth);
                    },
                    reservedSize: 30,
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: const FlGridData(show: false),
            ),
          );
        },
      ),
    );
  }
}

Color lerpGradient(List<Color> colors, List<double>? stops, double t) {
  if (colors.isEmpty) throw ArgumentError('"colors" is empty.');
  if (colors.length == 1) return colors[0];

  stops ??= List.generate(colors.length, (i) => i / (colors.length - 1));

  for (int i = 0; i < stops.length - 1; i++) {
    final start = stops[i], end = stops[i + 1];
    final colorStart = colors[i], colorEnd = colors[i + 1];

    if (t <= start) return colorStart;
    if (t < end) {
      final sectionT = (t - start) / (end - start);
      return Color.lerp(colorStart, colorEnd, sectionT)!;
    }
  }
  return colors.last;
}
