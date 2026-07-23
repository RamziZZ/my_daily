import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  final Widget child;

  const PagePadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          50,
          20,
          20,
        ),
        child: child,
      ),
    );
  }
}