import 'package:flutter/material.dart';
import 'package:kelompok_1/common/tiles_builder.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';

class PageMenuTiles extends StatelessWidget {
  final List<PageMenuTileModel> tileData;
  final bool isSecond;

  const PageMenuTiles({Key? key, required this.tileData, this.isSecond: false}) : super(key: key);

  Widget _tileBuilder(context, PageMenuTileModel tile) {
    return Expanded(
      child: GestureDetector(
        onTap: tile.onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          color: isSecond ? const Color(0xff494949) : const Color(0xff3c3c3c),
          child: Center(
              child: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ((MediaQuery.of(context).size.height * 0.9 / 4) + 25) * 0.7,
                child: Image(
                  image: AssetImage(tile.imageAsset!),
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                tile.text,
                style: TextStyle(
                  color: tile.textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: (MediaQuery.of(context).size.height * 0.9 / 4) * 0.1,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tiles = tilesBuilder(
      context,
      data: tileData,
      tileBuilder: _tileBuilder,
    );

    return Column(
      children: tiles,
    );
  }
}
