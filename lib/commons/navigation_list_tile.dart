import 'package:flutter/material.dart';
import 'package:tourly/utilities/colors.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final Widget? targetWidget; // Add this field for navigation

  CollapsingListTile({
    required this.title,
    required this.icon,
    required this.animationController,
    this.targetWidget,
  });

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
    return GestureDetector(
      onTap: () {
        if (widget.targetWidget != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.targetWidget!),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: kPrimaryClr,
              size: 38,
            ),
            SizedBox(
              width: sizedBoxAnimation.value,
            ),
            (widthAnimation.value >= 220)
                ? Text(
                    widget.title,
                    style: TextStyle(
                        color: kPrimaryshClr,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
