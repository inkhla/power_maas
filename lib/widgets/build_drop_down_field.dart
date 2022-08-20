import 'package:flutter/material.dart';

class BuildDropDownField extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const BuildDropDownField({
    Key? key,
    required this.onClicked,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: onClicked,
    );
  }
}