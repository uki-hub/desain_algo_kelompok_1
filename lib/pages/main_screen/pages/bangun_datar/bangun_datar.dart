import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/belah_ketupat/belah_ketupat.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/jajar_genjang/jajar_genjang.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/layang_layang/layang_layang.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/lingkaran/lingkaran.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/persegi/persegi.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/persegi_panjang/persegi_panjang.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/segitiga/segitiga.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/trapesium/trapesium.dart';
import 'package:kelompok_1/pages/main_screen/widgets/page_menu_tiles_second.dart';
import 'package:page_transition/page_transition.dart';

class BangunDatar extends StatefulWidget {
  @override
  _BangunDatarState createState() => _BangunDatarState();
}

class _BangunDatarState extends State<BangunDatar> {
  bool _isDone = false;
  List<PageMenuTileModel> get _menuData => [
                PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/persegi.png',
          text: 'Persegi',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: Persegi(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/persegi_panjang.png',
          text: 'Persegi Panjang',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: PersegiPanjang(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          isSingleRow: true,
          imageAsset: 'assets/images/bangun_datar/segitiga.png',
          text: 'Segitiga',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: Segitiga(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/trapesium.png',
          text: 'Trapesium',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: Trapesium(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/jajar_genjang.png',
          text: 'Jajar Genjang',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: JajarGenjang(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        
        PageMenuTileModel(
          isSingleRow: true,
          imageAsset: 'assets/images/bangun_datar/lingkaran.png',
          text: 'Lingkaran',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: Lingkaran(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/layang_layang.png',
          text: 'Layang Layang',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: LayangLayang(),
              type: PageTransitionType.fade,
            ));
          },
        ),
        PageMenuTileModel(
          imageAsset: 'assets/images/bangun_datar/belah_ketupat.png',
          text: 'Belah Ketupat',
          textColor: Colors.white,
          onTap: () {
            Navigator.of(context).push(PageTransition(
              child: BelahKetupat(),
              type: PageTransitionType.fade,
            ));
          },
        ),
      ];

  Future<void> delay() async {
    await Future.delayed(
      Duration(milliseconds: 400),
      () => setState(() => _isDone = !_isDone),
    );
  }

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _isDone = false;
        });
        await Future.delayed(Duration(milliseconds: 350));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff333333),
          body: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                Hero(
                  tag: 'Bangun Datar',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.9 / 4,
                      margin: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/bangun_datar.png'),
                            height: (MediaQuery.of(context).size.height * 0.9 / 4),
                            fit: BoxFit.contain,
                          ),
                          AnimatedPositioned(
                            bottom: _isDone ? -(MediaQuery.of(context).size.height * 0.9 / 4) * 0.35 : (MediaQuery.of(context).size.height * 0.9 / 4) * 0.4,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            child: Text(
                              'Bangun Datar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ((MediaQuery.of(context).size.height * 0.9) * 0.1) * 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: (MediaQuery.of(context).size.height * 0.9 / 4) * 0.4),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SingleChildScrollView(
                      child: PageMenuTilesCardSecond(tileData: _menuData),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
