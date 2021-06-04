import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/aritmatika.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/bangun_datar.dart';
import 'package:kelompok_1/widgets/custom_button.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _buildMainMenuTile({required String text, required String imageAssetPath, required VoidCallback onTap}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9 / 2,
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: text,
          child: Material(
            type: MaterialType.transparency,
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
          ),
        ),
      ),
    );
  }

  Widget _buildSubMenuTile({required IconData icon, required Color iconColor, required String text, VoidCallback? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xff3c3c3c),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff333333),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WillPopScope(
            onWillPop: () async {
              SystemNavigator.pop();
              exit(0);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildMainMenuTile(
                          text: 'Aritmatika',
                          imageAssetPath: 'assets/images/aritmatika.png',
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                              child: Aritmatika(),
                              type: PageTransitionType.fade,
                            ));
                          },
                        ),
                        _buildMainMenuTile(
                          text: 'Bangun Datar',
                          imageAssetPath: 'assets/images/bangun_datar.png',
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                              child: BangunDatar(),
                              type: PageTransitionType.fade,
                            ));
                          },
                        ),
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
                        _buildSubMenuTile(icon: Icons.settings_rounded, iconColor: Colors.grey, text: 'Pengaturan', onTap: () => Navigator.of(context).pushNamed('/settings')),
                        _buildSubMenuTile(icon: Icons.star_rounded, iconColor: Colors.amber[700]!, text: 'Beri Rating', onTap: () => Navigator.of(context).pushNamed('/beri_rating')),
                        _buildSubMenuTile(icon: Icons.info_rounded, iconColor: Colors.lightBlue[200]!, text: 'Tentang Kami', onTap: () => Navigator.of(context).pushNamed('/about')),
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
                      style: TextStyle(color: Colors.grey[50]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
