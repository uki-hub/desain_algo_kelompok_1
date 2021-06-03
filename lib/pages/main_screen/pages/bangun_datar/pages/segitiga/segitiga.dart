import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/models/rumus_builder_model.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/segitiga/rumus/keliling.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/pages/segitiga/rumus/luas.dart';
import 'package:kelompok_1/pages/main_screen/pages/bangun_datar/widgets/rumus_builder.dart';
import 'package:kelompok_1/pages/main_screen/widgets/basic_modal.dart';
import 'package:kelompok_1/pages/main_screen/widgets/page_menu_tiles_text_only.dart';
import 'package:kelompok_1/widgets/modal_pop_up.dart';
import 'package:kelompok_1/extensions/double.dart';

class Segitiga extends StatefulWidget {
  @override
  _SegitigaState createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  bool _isDone = false;
  List<PageMenuTileModel> get _menuData => [
        PageMenuTileModel(
          text: 'Luas',
          textColor: SegitigaLuas.gColor,
          onTap: () => ModalPopUp.show(context, modalPopUp: BasicModal(context, modal: SegitigaLuas())),
        ),
        PageMenuTileModel(
          text: 'Keliling',
          textColor: SegitigaLuas.gColor,
          onTap: () => ModalPopUp.show(context, modalPopUp: BasicModal(context, modal: SegitigaKeliling())),
        ),
        PageMenuTileModel(
          text: 'Keliling pakai builder',
          textColor: SegitigaLuas.gColor,
          onTap: () => ModalPopUp.show(context,
              modalPopUp: BasicModal(context,
                  modal: RumusBuilder(
                    model: RumusBuilderModel(
                      title: 'Keliling Segitiga',
                      color: Colors.yellow,
                      angka: [0, 0, 0],
                      angkaTextHint: ['Sisi 1', 'Sisi 2', 'Sisi 3'],
                      hitung: (angka) => angka[0] + angka[1] + angka[2],
                      rumusText: (angka, hasil, reg, bold) => [
                        Text('${angka[0].toPlainString()} + ${angka[1].toPlainString()} + ${angka[2].toPlainString()} = ${hasil.toPlainString()}', style: reg),
                        SizedBox(height: 5),
                      ],
                      rumusImageAsset: 'assets/images/rumus/keliling_segitiga.jpg',
                    ),
                  ))),
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
                  tag: 'Segitiga',
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
                              'Segitiga',
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
