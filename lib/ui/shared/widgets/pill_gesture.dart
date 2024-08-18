import 'package:flutter/material.dart';

class PillGesture extends StatelessWidget {
  const PillGesture({super.key, 
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    this.pillColor,
    this.title,
  });

  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Color? pillColor;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Align(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 5.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: pillColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: title ?? Container(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
