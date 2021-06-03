import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/modulus.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/pembagian.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/pengurangan.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/penjumlahan.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/perkalian.dart';
import 'package:kelompok_1/pages/main_screen/pages/artimatika/pages/perpangkatan.dart';
import 'package:kelompok_1/pages/main_screen/widgets/basic_modal.dart';
import 'package:kelompok_1/pages/main_screen/widgets/page_menu_tiles.dart';
import 'package:kelompok_1/widgets/modal_pop_up.dart';

class Aritmatika extends StatefulWidget {
  @override
  _AritmatikaState createState() => _AritmatikaState();
}

class _AritmatikaState extends State<Aritmatika> {
  bool _isDone = false;
  List<PageMenuTileModel> get _menuData => [
        PageMenuTileModel(
          imageAsset: Penjumlahan.gImageAsset,
          text: 'Penjumlahan',
          textColor: Penjumlahan.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Penjumlahan()),
            );
          },
          isSingleRow: true
        ),
        PageMenuTileModel(
          imageAsset: Pengurangan.gImageAsset,
          text: 'Pengurangan',
          textColor: Pengurangan.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Pengurangan()),
            );
          },
        ),
        PageMenuTileModel(
          imageAsset: Perkalian.gImageAsset,
          text: 'Perkalian',
          textColor: Perkalian.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Perkalian()),
            );
          },
        ),
        PageMenuTileModel(
          imageAsset: Pembagian.gImageAsset,
          text: 'Pembagian',
          textColor: Pembagian.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Pembagian()),
            );
          },
        ),
        PageMenuTileModel(
          imageAsset: Perpangkatan.gImageAsset,
          text: 'Perpangkatan',
          textColor: Perpangkatan.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Perpangkatan()),
            );
          },
        ),
        PageMenuTileModel(
          imageAsset: Modulus.gImageAsset,
          text: 'Modulus',
          textColor: Modulus.gColor,
          onTap: () {
            ModalPopUp.show(
              context,
              modalPopUp: BasicModal(context, modal: Modulus()),
            );
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
                  tag: 'Aritmatika',
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
                            image: AssetImage('assets/images/aritmatika.png'),
                            height: (MediaQuery.of(context).size.height * 0.9 / 4),
                            fit: BoxFit.contain,
                          ),
                          AnimatedPositioned(
                            bottom: _isDone ? -(MediaQuery.of(context).size.height * 0.9 / 4) * 0.35 : (MediaQuery.of(context).size.height * 0.9 / 4) * 0.4,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            child: Text(
                              'Aritmatika',
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
                    child: Theme(
                      data: ThemeData(accentColor: Theme.of(context).primaryColor),
                      child: SingleChildScrollView(
                        child: PageMenuTiles(tileData: _menuData),
                      ),
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
