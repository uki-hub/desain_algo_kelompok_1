import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';
import 'package:kelompok_1/pages/main_screen/widgets/page_menu_tiles.dart';

class Aritmatika extends StatefulWidget {
  @override
  _AritmatikaState createState() => _AritmatikaState();
}

class _AritmatikaState extends State<Aritmatika> {
  bool _isDone = false;
  final _menuData = [
                         PageMenuTileModel(
                          icon: Icon(Icons.add),
                          text: 'Penjumlahan',
                          backgroundColor: Colors.white,
                          onTap: () {},
                        ),
                         PageMenuTileModel(
                          icon: Icon(Icons.add),
                          text: 'Penjumlahan',
                          backgroundColor: Colors.white,
                          onTap: () {},
                        ),
                         PageMenuTileModel(
                          icon: Icon(Icons.add),
                          text: 'Penjumlahan',
                          backgroundColor: Colors.white,
                          onTap: () {},
                        ),
                         PageMenuTileModel(
                          icon: Icon(Icons.add),
                          text: 'Penjumlahan',
                          backgroundColor: Colors.white,
                          onTap: () {},
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
                        color: Color(0xff252526),
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
                    child: SingleChildScrollView(
                      child: PageMenuTilesCard(tileData: _menuData),
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
