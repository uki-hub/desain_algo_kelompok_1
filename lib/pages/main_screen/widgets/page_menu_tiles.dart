import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';

class PageMenuTilesCard extends StatelessWidget {
  final List<PageMenuTileModel> tileData;

  const PageMenuTilesCard({Key? key, required this.tileData}) : super(key: key);

  Widget _buildCard(PageMenuTileModel data) {
    return Expanded(
      child: GestureDetector(
        onTap: data.onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          color: const Color(0xff3c3c3c),
          child: Center(child: data.icon),
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
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height * 0.9 / 4),
            child: Row(
              children: [
                _buildCard(firstData),
                if (secondData != null) _buildCard(secondData),
              ],
            ),
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
