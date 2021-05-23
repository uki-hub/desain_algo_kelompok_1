import 'dart:ui';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Expanded _buildMainMenuTile({String text, String imageAssetPath}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Color(0xff252526),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            image: AssetImage(imageAssetPath),
          ),
        ),
        child: Container(
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
                fontSize: ((MediaQuery.of(context).size.height * 0.9) * 0.1) * 0.7,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubMenuTile({IconData icon, Color iconColor, String text}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xff3c3c3c),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: (MediaQuery.of(context).size.height * 0.25) * 0.05),
            Icon(
              icon,
              color: iconColor,
              size: (MediaQuery.of(context).size.height * 0.25) * 0.45,
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.25) * 0.05),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: ((MediaQuery.of(context).size.height * 0.25) * 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_dark.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: double.infinity,
                  child: Column(
                    children: [
                      _buildMainMenuTile(text: 'Aritmatika', imageAssetPath: 'assets/images/aritmatika.png'),
                      _buildMainMenuTile(text: 'Bangun Datar', imageAssetPath: 'assets/images/bangun_datar_1.png'),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      _buildSubMenuTile(icon: Icons.settings_rounded, iconColor: Colors.grey, text: 'Pengaturan'),
                      _buildSubMenuTile(icon: Icons.star_rounded, iconColor: Colors.amber[700], text: 'Beri Rating'),
                      _buildSubMenuTile(icon: Icons.info_rounded, iconColor: Colors.lightBlue[200], text: 'Tentang Kami'),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xff323233),
                    // borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '© ${DateTime.now().year} - Kelompok 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[50],
                    ),
                  ),
                ),
                // SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
