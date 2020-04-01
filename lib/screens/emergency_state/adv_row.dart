import 'package:flutter/material.dart';

class AdvRow extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget divider;
  final Key key;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;
  final List<Widget> children;

  AdvRow({
    this.padding,
    this.margin,
    this.divider,
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    List<Widget> children = const <Widget>[],
  })  : this.key = key,
        this.mainAxisAlignment = mainAxisAlignment,
        this.mainAxisSize = mainAxisSize,
        this.crossAxisAlignment = crossAxisAlignment,
        this.textDirection = textDirection,
        this.verticalDirection = verticalDirection,
        this.textBaseline = textBaseline,
        this.children = children;

  @override
  Widget build(BuildContext context) {
    List<Widget> newChildren = _rebuildChildren();

    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: newChildren,
      ),
    );
  }

  List<Widget> _rebuildChildren() {
    if (children.length == 0) return [];
    List<Widget> newChildren = [];

    for (Widget child in children) {
      if (child != null) {
        newChildren.add(child);
        if (divider != null) newChildren.add(divider);
      }
    }

    if (newChildren.length > 0 && divider != null) newChildren.removeAt(newChildren.length - 1);

    return newChildren;
  }
}

class RowDivider extends StatelessWidget {
  final double size;
  final Color color;

  RowDivider(double size, {Color color})
      : this.size = size ?? 0.0,
        this.color = color ?? Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(width: size, height: 1.0, color: color);
  }
}