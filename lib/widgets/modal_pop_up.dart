import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kelompok_1/abstracts/base_modal_pop_up.dart';

class ModalPopUp extends StatefulWidget {
  final BaseModalPopUp modalPopUpForm;
  final bool showCloseIcon;
  final EdgeInsetsGeometry contentPadding;
  final double gapBetweenTitleContent;
  final double gapBetweenContentActions;

  const ModalPopUp({
    Key? key,
    required this.modalPopUpForm,
    required this.contentPadding,
    required this.showCloseIcon,
    required this.gapBetweenTitleContent,
    required this.gapBetweenContentActions,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ModalPopUpState();

  static Future<bool?> show(
    BuildContext context, {
    Key? key,
    required BaseModalPopUp modalPopUp,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return ModalPopUp(
          key: key,
          modalPopUpForm: modalPopUp,
          showCloseIcon: modalPopUp.showCloseIcon,
          contentPadding: modalPopUp.contentPadding,
          gapBetweenTitleContent: modalPopUp.gapBetweenTitleContent,
          gapBetweenContentActions: modalPopUp.gapBetweenContentActions,
        );
      },
    );
  }
}

class _ModalPopUpState extends State<ModalPopUp> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _popUpAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _popUpAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    _animationController?.addListener(() => setState(() {}));
    _animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    final closeIcon = Positioned(
      right: 2,
      top: 2,
      child: GestureDetector(
        onTap: Navigator.of(context).pop,
        child: Icon(
          Icons.close,
          size: 30,
          color: Colors.grey[600],
        ),
      ),
    );
    final title = [
      widget.modalPopUpForm.title,
      SizedBox(height: widget.gapBetweenTitleContent),
    ];
    final content = [
      widget.modalPopUpForm.content,
      SizedBox(height: widget.gapBetweenContentActions),
    ];
    final actions = [
      if (widget.modalPopUpForm.actions != null) widget.modalPopUpForm.actions!,
      if (widget.modalPopUpForm.actions != null) SizedBox(height: 20),
    ];

    return GestureDetector(
      onTap: Navigator.of(context).pop,
      child: Container(
        color: Colors.grey[600]?.withOpacity(0.3), //TODO: ganti souce
        child: Center(
          child: ScaleTransition(
            scale: _popUpAnimation!,
            child: GestureDetector(
              //TODO: fix ini, hitBehaviour ga ada effect
              onTap: () {},
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.all(10.0),
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  ),
                  child: Stack(
                    fit: StackFit.loose,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            padding: widget.contentPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...title,
                                ...content,
                                ...actions,
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (widget.showCloseIcon) closeIcon,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
