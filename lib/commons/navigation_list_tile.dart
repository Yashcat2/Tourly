import 'package:flutter/material.dart';
import 'package:tourly/utilities/colors.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  CollapsingListTile(
      {required this.title,
      required this.icon,
      required this.animationController});

  @override
  State<CollapsingListTile> createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> widthAnimation, sizedBoxAnimation;
  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 70).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white,
            size: 38,
          ),
          SizedBox(
            width: sizedBoxAnimation.value,
          ),
          (widthAnimation.value >= 220)
              ? Text(
                  widget.title,
                  style: TextStyle(
                      color: kWhiteClr,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                )
              : Container(),
        ],
      ),
    );
  }
}
