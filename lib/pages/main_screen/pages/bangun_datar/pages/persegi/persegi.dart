import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/persegi/rumus/luas.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/persegi/rumus/keliling.dart';
import 'package:kelompok_1/pages/main_screen/widgets/basic_modal.dart';
import 'package:kelompok_1/pages/main_screen/widgets/page_menu_tiles_text_only.dart';
import 'package:kelompok_1/widgets/modal_pop_up.dart';

class Persegi extends StatefulWidget {
  @override
  _PersegiState createState() => _PersegiState();
}

class _PersegiState extends State<Persegi> {
  bool _isDone = false;
  List<PageMenuTileModel> get _menuData => [
        PageMenuTileModel(
          text: 'Luas',
          textColor: PersegiLuas.gColor,
          onTap: () => ModalPopUp.show(context, modalPopUp: BasicModal(context, modal: PersegiLuas())),
        ),
        PageMenuTileModel(
          text: 'Keliling',
          textColor: PersegiLuas.gColor,
          onTap: () => ModalPopUp.show(context, modalPopUp: BasicModal(context, modal: PersegiKeliling())),
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
                  tag: 'Persegi',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.9 / 4,
                      margin: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        color: const Color(0xff3c3c3c),
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
                              'Persegi',
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
                      data: ThemeData(accentColor: const Color(0xff252526)),
                      child: SingleChildScrollView(
                        child: PageMenuTilesTextOnly(tileData: _menuData, isSecond: true),
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