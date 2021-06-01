import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';

class PageMenuTilesTextOnly extends StatelessWidget {
  final List<PageMenuTileModel> tileData;
  final bool isSecond;

  const PageMenuTilesTextOnly({Key? key, required this.tileData, this.isSecond: false}) : super(key: key);

  Widget _buildCard(context, PageMenuTileModel tile) {
    return Expanded(
      child: GestureDetector(
        onTap: tile.onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          color: isSecond ? const Color(0xff494949) : const Color(0xff3c3c3c),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Text(
                tile.text,
                style: TextStyle(
                  color: tile.textColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: (MediaQuery.of(context).size.height * 0.9 / 4) * 0.1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    final result = <Widget>[];

    if (tileData.length <= 0)
      return result;
    else
      for (var i = 0; i < tileData.length; i++) {
        final firstData = tileData.elementAt(i);
        PageMenuTileModel? secondData;
        if ((i + 1) > tileData.length - 1) {
          secondData = null;
        } else {
          secondData = tileData.elementAt(i + 1);
          i++;
        }

        result.add(
          Row(
            children: [
              _buildCard(context, firstData),
              if (secondData != null) _buildCard(context, secondData),
            ],
          ),
        );
      }

    result.add(SizedBox(height: (MediaQuery.of(context).size.height * 0.9 / 4) * 0.1));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final tiles = _buildTiles(context);
    return Column(
      children: tiles,
    );
  }
}
