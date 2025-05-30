import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/functions_uses.dart';

class PremiumDrawer extends StatelessWidget {
  const PremiumDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Color(0xFF071324),
      child: Container(
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
            // Header Section

            // Menu Items
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(size / 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    mspacer(height: size / 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size / 35, size / 35, size / 35, 0),
                      child: Text(
                        'drizzle',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: size / 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size / 35, 0, size / 35, size / 35),
                      child: Text(
                        'A Weather Experience',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size / 40,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    _buildDrawerItem(
                      icon: Icons.home_outlined,
                      title: 'Home',
                      onTap: () => Navigator.pop(context),
                    ),
                    _buildDrawerItem(
                      icon: Icons.location_on_outlined,
                      title: 'Find City Weather',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to locations screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.radar_outlined,
                      title: 'UV Safety Index',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to radar screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.trending_up_outlined,
                      title: 'Wind Status',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to trends screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.map_outlined,
                      title: 'Sunrise & Sunset',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to map screen
                      },
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Divider(
                        color: Colors.white38,
                        thickness: 0.5,
                      ),
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.pop(context);
                        Flushbar(
                          barBlur: 20,
                          margin: EdgeInsets.all(size / 35),
                          borderRadius: BorderRadius.circular(size / 20),
                          title: "⚙️Coming Soon!",
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          message:
                              "Settings will be ready shortly.\nThanks for your patience!😊",
                          duration: Duration(seconds: 2),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                        // Navigate to settings screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      onTap: () {
                        Navigator.pop(context);
                        Flushbar(
                          barBlur: 20,
                          margin: EdgeInsets.all(size / 35),
                          borderRadius: BorderRadius.circular(size / 20),
                          title: "🛠️Coming Soon!",
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          message:
                              "Help & Support is on its way.\nWe’ll be here for you soon!🤗",
                          duration: Duration(seconds: 2),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                        // Navigate to help screen
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.star_outline,
                      title: 'Rate App',
                      onTap: () {
                        Navigator.pop(context);
                        Flushbar(
                          barBlur: 20,
                          margin: EdgeInsets.all(size / 35),
                          borderRadius: BorderRadius.circular(size / 20),
                          title: "✨Coming Soon!",
                          backgroundColor: Colors.grey.withOpacity(0.1),
                          message:
                              "Rating the app will be possible very soon.\nHang tight!💫",
                          duration: Duration(seconds: 2),
                          flushbarPosition: FlushbarPosition.TOP,
                        ).show(context);
                        // Show rating dialog
                      },
                    ),
                    mspacer(height: size / 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '~Made by KeshavG_8605✨',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: size / 35),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Color(0xff84FFF5).withOpacity(0.8),
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white.withOpacity(0.4),
          size: 14,
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
}
