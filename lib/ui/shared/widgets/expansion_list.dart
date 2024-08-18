import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

import '../shared_styles.dart';

class ExpansionList<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Function(dynamic) onItemSelected;
  final bool smallVersion;
  const ExpansionList({
    super.key,
    required this.items,
    required this.title,
    required this.onItemSelected,
    this.smallVersion = false,
  });

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  final double startingHeight = fieldHeight;
  double? expandedHeight;
  bool expanded = false;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.title;
    _calculateExpandedHeight();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: fieldPadding,
      duration: const Duration(milliseconds: 180),
      height: expanded
          ? expandedHeight
          : widget.smallVersion
              ? smallFieldHeight
              : startingHeight,
      decoration: fieldDecortaion.copyWith(
        boxShadow: expanded
            ? [const BoxShadow(blurRadius: 10, color: Colors.grey)]
            : null,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          ExpansionListItem(
            title: selectedValue!,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            showArrow: true,
            smallVersion: widget.smallVersion,
          ),
          Container(
            height: 2,
            color: Colors.grey[300],
          ),
          ..._getDropdownListItems()
        ],
      ),
    );
  }

  List<Widget> _getDropdownListItems() {
    return widget.items
        .map((item) => ExpansionListItem(
            smallVersion: widget.smallVersion,
            title: item.toString(),
            onTap: () {
              setState(() {
                expanded = !expanded;
                selectedValue = item.toString();
              });

              widget.onItemSelected(item);
            }))
        .toList();
  }

  void _calculateExpandedHeight() {
    expandedHeight = 2 +
        (widget.smallVersion ? smallFieldHeight : fieldHeight) +
        (widget.items.length *
            (widget.smallVersion ? smallFieldHeight : fieldHeight));
  }
}

class ExpansionListItem extends StatelessWidget {
  const ExpansionListItem({
    super.key,
    this.onTap,
    required this.title,
    this.showArrow = false,
    this.smallVersion = false,
  });

  final Function()? onTap;
  final String title;
  final bool showArrow;
  final bool smallVersion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: smallVersion ? smallFieldHeight : fieldHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: subtitleStyle(context)
                    .copyWith(fontSize: smallVersion ? 12 : 15),
              ),
            ),
            showArrow
                ? Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey[700],
                    size: 20,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
