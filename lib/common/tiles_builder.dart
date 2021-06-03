import 'package:flutter/material.dart';
import 'package:kelompok_1/pages/main_screen/models/page_menu_tile_model.dart';

List<Widget> tilesBuilder(
  BuildContext context, {
  required List<PageMenuTileModel> data,
  required Widget Function(BuildContext, PageMenuTileModel) tileBuilder,
  bool noHeight: false,
}) {
  final result = <Widget>[];

  if (data.length <= 0)
    return result;
  else
    for (var i = 0; i < data.length; i++) {
      final firstData = data.elementAt(i);
      PageMenuTileModel? secondData;
      if ((i + 1) > data.length - 1 || firstData.isSingleRow) {
        secondData = null;
      } else {
        secondData = data.elementAt(i + 1);
        if (secondData.isSingleRow) {
          secondData = null;
        } else {
          i++;
        }
      }

      result.add(
        Container(
          width: double.infinity,
          height: noHeight ? null : (MediaQuery.of(context).size.height * 0.9 / 4) + 25,
          child: Row(
            children: [
              tileBuilder(context, firstData),
              if (secondData != null) tileBuilder(context, secondData),
            ],
          ),
        ),
      );
    }

  result.add(SizedBox(height: (MediaQuery.of(context).size.height * 0.9 / 4) * 0.1));
  return result;
}
