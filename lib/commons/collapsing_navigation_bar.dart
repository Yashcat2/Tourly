import 'package:flutter/material.dart';
import 'package:tourly/commons/navigation_list_tile.dart';
import 'package:tourly/model/navigation_model.dart';
import 'package:tourly/utilities/colors.dart';

class CollapsingNavigationBar extends StatefulWidget {
  @override
  State<CollapsingNavigationBar> createState() =>
      _CollapsingNavigationBarState();
}

class _CollapsingNavigationBarState extends State<CollapsingNavigationBar>
    with SingleTickerProviderStateMixin {
  final double maxWidth = 250;
  final double minWidth = 70;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initialize the width animation
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose(); // Clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: kWhiteshClr,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                  title: navigatioItems[counter].title,
                  icon: navigatioItems[counter].icon,
                  animationController: _animationController,
                  targetWidget:
                      navigatioItems[counter].targetWidget, // Pass targetWidget
                );
              },
              itemCount: navigatioItems.length,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
                isCollapsed
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: _animationController,
              color: kPrimaryClr,
              size: 50,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
