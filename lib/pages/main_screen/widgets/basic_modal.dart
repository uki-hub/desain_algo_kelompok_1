import 'package:flutter/material.dart';
import 'package:kelompok_1/abstracts/base_basic_modal.dart';
import 'package:kelompok_1/abstracts/base_modal_pop_up.dart';

class BasicModal implements BaseModalPopUp {
  final BuildContext context;
  final BaseBasicModal modal;

  BasicModal(
    this.context, {
    required this.modal,
  });

  @override
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(horizontal: 5, vertical: 5);

  @override
  double gapBetweenContentActions = 0;

  @override
  double gapBetweenTitleContent = 10;

  @override
  bool showCloseIcon = true;

  @override
  Widget get title => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal:(MediaQuery.of(context).size.height * 0.1) * 0.5),
            child: Text(
              modal.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.height * 0.1) * 0.3,
                color: Colors.white,
              ),
            ),
          ),
          if (modal.imageAsset != null)
            SizedBox(
              height: ((MediaQuery.of(context).size.height * 0.9 / 4) + 25) * 0.2,
              child: Image(
                image: AssetImage(modal.imageAsset!),
                fit: BoxFit.contain,
              ),
            ),
        ],
      );

  @override
  Widget get content => modal;

  @override
  Widget? get actions => null;
}
