import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    super.key,
    required double width,
    required double height,
  })  : _width = width,
        _height = height;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(screenWidth(context) < 700 ? 15.0 : 25.0),
        // side: BorderSide(width: 3),
      ),
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 50, color: Colors.grey[500]),
            Text(
              'Sertifikat tidak ada',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
