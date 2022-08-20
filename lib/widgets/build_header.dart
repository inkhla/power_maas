import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  final String header;
  final Widget child;
  const BuildHeader({
    Key? key,
    required this.child,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        child,
      ],
    );
  }
}
