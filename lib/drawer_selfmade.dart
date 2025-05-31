import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/functions_uses.dart';

class PremiumDrawer extends StatelessWidget {
  const PremiumDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF071324),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF071324),
                  Color(0xFF071324),
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.018),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mspacer(height: height * 0.05),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Text(
                            'drizzle',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.03, 4, width * 0.03, width * 0.04),
                          child: Text(
                            'A Weather App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.home_outlined,
                          title: 'Home',
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.location_on_outlined,
                          title: 'Find City Weather',
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.radar_outlined,
                          title: 'UV Safety Index',
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.trending_up_outlined,
                          title: 'Wind Status',
                          onTap: () => Navigator.pop(context),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.map_outlined,
                          title: 'Sunrise & Sunset',
                          onTap: () => Navigator.pop(context),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Divider(
                            color: Colors.white38,
                            thickness: 0.5,
                          ),
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.settings_outlined,
                          title: 'Settings',
                          onTap: () {
                            Navigator.pop(context);
                            showInfoFlushbar(
                              context,
                              width,
                              "⚙️Coming Soon!",
                              "Settings will be ready shortly.\nThanks for your patience!😊",
                            );
                          },
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.help_outline,
                          title: 'Help & Support',
                          onTap: () {
                            Navigator.pop(context);
                            showInfoFlushbar(
                              context,
                              width,
                              "🛠️Coming Soon!",
                              "Help & Support is on its way.\nWe’ll be here for you soon!🤗",
                            );
                          },
                        ),
                        _buildDrawerItem(
                          width: width,
                          icon: Icons.star_outline,
                          title: 'Rate App',
                          onTap: () {
                            Navigator.pop(context);
                            showInfoFlushbar(
                              context,
                              width,
                              "✨Coming Soon!",
                              "Rating the app will be possible very soon.\nHang tight!💫",
                            );
                          },
                        ),
                        mspacer(height: height * 0.08),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '~Made by KeshavG_8605✨',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem({
    required double width,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: const Color(0xff84FFF5).withOpacity(0.8),
            size: width * 0.055,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: width * 0.042,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withOpacity(0.4),
          size: width * 0.035,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
        hoverColor: Colors.white.withOpacity(0.05),
        splashColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  void showInfoFlushbar(
      BuildContext context, double width, String title, String message) {
    Flushbar(
      barBlur: 20,
      margin: EdgeInsets.all(width * 0.04),
      borderRadius: BorderRadius.circular(width * 0.05),
      title: title,
      backgroundColor: Colors.grey.withOpacity(0.1),
      message: message,
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
