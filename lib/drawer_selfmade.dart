import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/functions_uses.dart';

class PremiumDrawer extends StatelessWidget {
  const PremiumDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: const Color(0xFF02101B),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF02101B),
              Color(0xFF000F18),
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
                      padding: EdgeInsets.all(size / 35),
                      child: Text(
                        'Weathery Pro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size / 35),
                      child: Text(
                        'Premium Weather Experience',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
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
                        color: Colors.white24,
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

                    const Spacer(),

                    // Premium Badge
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.amber.shade400,
                            Colors.orange.shade600,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.workspace_premium,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Premium Active',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
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
            color: Colors.white.withOpacity(0.8),
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
